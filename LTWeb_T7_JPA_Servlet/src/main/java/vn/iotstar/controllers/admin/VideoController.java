package vn.iotstar.controllers.admin;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import vn.iotstar.entity.Category;
import vn.iotstar.entity.Video;
import vn.iotstar.services.ICategoryService;
import vn.iotstar.services.IVideoService;
import vn.iotstar.services.impl.CategoryServiceImpl;
import vn.iotstar.services.impl.VideoServiceImpl;
import static vn.iotstar.utils.Constant.*;

@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 1024 * 1024 * 5, maxRequestSize = 1024 * 1024 * 5 * 5)
@WebServlet(urlPatterns = { "/admin/videos", "/admin/video/add", "/admin/video/insert", "/admin/video/edit",
        "/admin/video/update", "/admin/video/delete" })
public class VideoController extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private IVideoService videoService = new VideoServiceImpl();
    private ICategoryService categoryService = new CategoryServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");

        String url = req.getRequestURI();

        if (url.contains("/admin/videos")) {
            List<Video> videos = videoService.findAll();
            req.setAttribute("listVideos", videos);
            req.getRequestDispatcher("/views/admin/video-list.jsp").forward(req, resp);

        } else if (url.contains("/admin/video/add")) {
            List<Category> categories = categoryService.findAll();
            req.setAttribute("listCategories", categories);
            req.getRequestDispatcher("/views/admin/video-add.jsp").forward(req, resp);

        } else if (url.contains("/admin/video/edit")) {
            String videoId = req.getParameter("id");
            Video video = videoService.findById(videoId);
            List<Category> categories = categoryService.findAll();
            req.setAttribute("video", video);
            req.setAttribute("listCategories", categories);
            req.getRequestDispatcher("/views/admin/video-edit.jsp").forward(req, resp);

        } else if (url.contains("/admin/video/delete")) {
            String videoId = req.getParameter("id");
            try {
                videoService.delete(videoId);
            } catch (Exception e) {
                e.printStackTrace();
            }
            resp.sendRedirect(req.getContextPath() + "/admin/videos");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");

        String url = req.getRequestURI();

        if (url.contains("/admin/video/insert")) {
            String videoId = req.getParameter("videoId");
            String title = req.getParameter("title");
            int views = Integer.parseInt(req.getParameter("views"));
            String description = req.getParameter("description");
            int active = Integer.parseInt(req.getParameter("active"));
            String categoryId = req.getParameter("categoryId");

            Category category = categoryService.findById(Integer.parseInt(categoryId));

            if (category == null) {
                req.setAttribute("errorMessage", "Category không tồn tại.");
                req.getRequestDispatcher("/views/admin/video-add.jsp").forward(req, resp);
                return;
            }

            String poster = handleImageUpload(req.getPart("poster"), req.getParameter("poster"), DIR);
            Video video = new Video(videoId, active, description, poster, title, views, category);
            videoService.insert(video);

            resp.sendRedirect(req.getContextPath() + "/admin/videos");

        } else if (url.contains("/admin/video/update")) {
            String videoId = req.getParameter("videoId");
            Video video = videoService.findById(videoId);

            video.setTitle(req.getParameter("title"));
            video.setViews(Integer.parseInt(req.getParameter("views")));
            video.setDescription(req.getParameter("description"));
            video.setActive(Integer.parseInt(req.getParameter("active")));
            String categoryId = req.getParameter("categoryId");
            video.setCategory(categoryService.findById(Integer.parseInt(categoryId)));

            String poster = handleImageUpload(req.getPart("poster"), video.getPoster(), DIR);
            video.setPoster(poster);

            videoService.update(video);
            resp.sendRedirect(req.getContextPath() + "/admin/videos");
        }
    }

    private String handleImageUpload(Part part, String currentImage, String uploadPath) throws IOException {
        String imageName = currentImage;
        if (part != null && part.getSize() > 0) {
            String filename = Paths.get(part.getSubmittedFileName()).getFileName().toString();
            String ext = filename.substring(filename.lastIndexOf(".") + 1);
            imageName = System.currentTimeMillis() + "." + ext;
            part.write(uploadPath + File.separator + imageName);
        }
        return imageName;
    }
}
