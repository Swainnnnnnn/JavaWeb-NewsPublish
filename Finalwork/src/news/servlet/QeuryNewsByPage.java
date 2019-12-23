package news.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.rainsia.news.dao.NewsDao;
import com.rainsia.news.dao.impl.NewsDaoImpl;
import com.rainsia.news.entity.News;
import com.rainsia.news.entity.Page;

/**
 * Servlet implementation class QeuryNewsByPage
 */
@WebServlet("/QeuryNewsByPage")
public class QeuryNewsByPage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QeuryNewsByPage() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		NewsDao newsDao = new NewsDaoImpl();
		int count = newsDao.getTotalCount();
		
		Page p = new Page();
		
		String cPage = request.getParameter("currentPage");
		
		if(cPage == null){
			cPage = "1";
		}
		int currentPage = Integer.parseInt(cPage);
		p.setCurrentPage(currentPage);
		
		int totalCount = newsDao.getTotalCount();
		p.setTotalCount(totalCount);
		
		int pageSize = 3;
		p.setPageSize(pageSize);
		
		List<News> listNews = newsDao.queryNewsByPage(currentPage);
		
		System.out.println(listNews);
		System.out.println(count);
							
		
		p.setListNews(listNews);
		request.setAttribute("p", p);
		request.getRequestDispatcher("dosearch.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
