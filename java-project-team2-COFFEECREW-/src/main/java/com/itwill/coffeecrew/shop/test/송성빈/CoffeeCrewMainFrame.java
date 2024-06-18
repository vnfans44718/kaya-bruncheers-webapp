package com.itwill.coffeecrew.shop.test.송성빈;

import java.awt.EventQueue;

import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.border.EmptyBorder;
import javax.swing.table.DefaultTableModel;

import com.itwill.coffeecrew.shop.cart.CartService;
import com.itwill.coffeecrew.shop.member.Member;
import com.itwill.coffeecrew.shop.member.MemberService;
import com.itwill.coffeecrew.shop.order.Order;
import com.itwill.coffeecrew.shop.order.OrderService;
import com.itwill.coffeecrew.shop.product.ProductService;

import java.awt.BorderLayout;
import javax.swing.JTabbedPane;
import javax.swing.JMenuBar;
import javax.swing.JMenuItem;
import javax.swing.JMenu;
import javax.swing.JButton;
import javax.swing.JLabel;
import javax.swing.SwingConstants;
import javax.swing.ImageIcon;
import java.awt.Color;
import java.awt.FlowLayout;
import java.awt.Dimension;
import java.awt.Toolkit;
import javax.swing.JSeparator;
import java.awt.Rectangle;
import javax.swing.JScrollPane;
import javax.swing.Icon;
import java.awt.Font;
import java.awt.event.ActionListener;
import java.util.HashMap;
import java.util.List;
import java.util.Vector;
import java.awt.event.ActionEvent;


import java.awt.SystemColor;
import com.itwill.coffeecrew.shop.ui.OrderCartPanel;
import com.itwill.coffeecrew.shop.ui.OrderPaymentPanel;
import com.itwill.coffeecrew.shop.ui.ProductDetailPanel;
import com.itwill.coffeecrew.shop.ui.ProductListPanel;
import com.itwill.coffeecrew.shop.ui.OrderListPanel;
import com.itwill.coffeecrew.shop.ui.OrderDetailPanel;

/********* 1.CoffeeCrewService멤버필드선언(member, product, order, cart) *****/
/*private MemberService memberService;
private ProductService productService;
private OrderService orderService;
private CartService cartService;*/


public class CoffeeCrewMainFrame extends JFrame {
	/***** 1.로그인한 Member객체, 주문중인 Order객체 멤버필드 선언 **********/
	Member loginMember = null;
	Order tempOrder = null;
	/***** 2.패널상수선언 *******************************************/
	public static int TOP_SHOP_MAIN_PANEL = 0;
	public static int TOP_SHOP_MEMBER_PANEL = 1;
	public static int TOP_SHOP_PRODUCT_PANEL = 2;
	public static int TOP_SHOP_ORDER_PANEL = 3;
	
	
	public static int SUB_MEMBER_LOGIN_PANEL = 11;
	public static int SUB_MEMBER_JOIN_PANEL = 12;
	public static int SUB_MEMBER_INFO_PANEL = 13;
	public static int SUB_MEMBER_FIND_PANEL = 14;
	public static int SUB_PRODUCT_LIST_PANEL = 21;
	public static int SUB_PRODUCT_DETAIL_PANEL = 22;
	public static int SUB_ORDER_LIST_PANEL = 31;
	public static int SUB_ORDER_DETAIL_PANEL = 32;
	public static int SUB_ORDER_PAYMENT_PANEL = 33;
	public static int SUB_ORDER_CART_PANEL = 34;
	
	/***** 3.사용자정의패널멤버필드선언 *******************************************/

	
	/*****************************************************/
	private JPanel contentPane;
	private JMenuItem joinMenuItem;
	private JMenuItem loginMenuItem;
	private JMenuItem logoutMenuItem;
	private JTabbedPane memberTabbedPane;
	private JTabbedPane productTabbedPane;
	private JTabbedPane orderTabbedPane;
	private JTabbedPane shopTabbedPane;

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					CoffeeCrewMainFrame frame = new CoffeeCrewMainFrame();
					frame.setVisible(true);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
	}

	/**
	 * Create the frame.
	 */
	public CoffeeCrewMainFrame() {
		setTitle("Coffee Crew");
		setIconImage(Toolkit.getDefaultToolkit().getImage(CoffeeCrewMainFrame.class.getResource("/image/title_logo_25.png")));
		setResizable(false);
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setBounds(100, 100, 417, 643);
		
		JMenuBar menuBar = new JMenuBar();
		menuBar.setBackground(new Color(253, 236, 166));
		setJMenuBar(menuBar);
		
		JMenu tabMenu = new JMenu("");
		tabMenu.setIcon(new ImageIcon(CoffeeCrewMainFrame.class.getResource("/image/menu_20.png")));
		menuBar.add(tabMenu);
		
		loginMenuItem = new JMenuItem("로그인");
		loginMenuItem.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				//로그인화면
				//memberTabbedPane.setSelectedIndex(1);
			}
		});
		tabMenu.add(loginMenuItem);
		
		joinMenuItem = new JMenuItem("회원가입");
		joinMenuItem.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				//회원가입화면
				//memberTabbedPane.setSelectedIndex(2);
			}
		});
		tabMenu.add(joinMenuItem);
		
		logoutMenuItem = new JMenuItem("로그아웃");
		logoutMenuItem.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				//로그아웃시 로그인화면
				//memberTabbedPane.setSelectedIndex(1);
			}
		});
		tabMenu.add(logoutMenuItem);
		
		JSeparator separator = new JSeparator();
		tabMenu.add(separator);
		
		JMenuItem exitMenuItem = new JMenuItem("종료");
		exitMenuItem.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				//애플리케이션 종료
				System.exit(0);
			}
		});
		tabMenu.add(exitMenuItem);
		contentPane = new JPanel();
		contentPane.setPreferredSize(new Dimension(10, 600));
		contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));

		setContentPane(contentPane);
		contentPane.setLayout(new BorderLayout(0, 0));
		
		shopTabbedPane = new JTabbedPane(JTabbedPane.TOP);
		shopTabbedPane.setFont(new Font("맑은 고딕", Font.PLAIN, 12));
		contentPane.add(shopTabbedPane, BorderLayout.CENTER);
		
		JPanel mainPanel = new JPanel();
		mainPanel.setToolTipText("");
		mainPanel.setPreferredSize(new Dimension(200, 600));
		mainPanel.setFont(new Font("맑은 고딕", Font.PLAIN, 12));
		mainPanel.setBackground(SystemColor.menu);
		shopTabbedPane.addTab("메인", null, mainPanel, null);
		mainPanel.setLayout(new BorderLayout(0, 0));
		
		JLabel mainLabel = new JLabel("");
		mainLabel.setHorizontalAlignment(SwingConstants.CENTER);
		mainLabel.setIcon(new ImageIcon(CoffeeCrewMainFrame.class.getResource("/image/main_380_450.jpg")));
		mainPanel.add(mainLabel, BorderLayout.CENTER);
		
		JPanel mainButtonPanel = new JPanel();
		mainPanel.add(mainButtonPanel, BorderLayout.SOUTH);
		
		JButton productListButton = new JButton("전체상품");
		productListButton.setFont(new Font("맑은 고딕", Font.PLAIN, 12));
		mainButtonPanel.add(productListButton);
		
		JButton orderListButton = new JButton("주문내역");
		orderListButton.setFont(new Font("맑은 고딕", Font.PLAIN, 12));
		mainButtonPanel.add(orderListButton);
		
		JButton orderCartButton = new JButton("장바구니");
		orderCartButton.setFont(new Font("맑은 고딕", Font.PLAIN, 12));
		mainButtonPanel.add(orderCartButton);
		
		JPanel memberPanel = new JPanel();
		memberPanel.setFont(new Font("맑은 고딕", Font.PLAIN, 12));
		memberPanel.setName("");
		memberPanel.setToolTipText("");
		shopTabbedPane.addTab("회원", null, memberPanel, null);
		memberPanel.setLayout(new BorderLayout(0, 0));
		
		memberTabbedPane = new JTabbedPane(JTabbedPane.TOP);
		memberTabbedPane.setFont(new Font("맑은 고딕", Font.PLAIN, 12));
		memberTabbedPane.setBackground(new Color(240, 240, 240));
		memberPanel.add(memberTabbedPane, BorderLayout.CENTER);
		
		JPanel memberLoginPanel = new JPanel();
		memberLoginPanel.setFont(new Font("맑은 고딕", Font.PLAIN, 12));
		memberTabbedPane.addTab("로그인", null, memberLoginPanel, null);
		
		JPanel memberJoinPanel = new JPanel();
		memberJoinPanel.setFont(new Font("맑은 고딕", Font.PLAIN, 12));
		memberTabbedPane.addTab("회원가입", null, memberJoinPanel, null);
		
		JPanel memberInfoPanel = new JPanel();
		memberInfoPanel.setFont(new Font("맑은 고딕", Font.PLAIN, 12));
		memberTabbedPane.addTab("회원정보수정", null, memberInfoPanel, null);
		
		JPanel memberFindPanel = new JPanel();
		memberFindPanel.setFont(new Font("맑은 고딕", Font.PLAIN, 12));
		memberTabbedPane.addTab("아이디/비밀번호찾기", null, memberFindPanel, null);
		
		JPanel productPanel = new JPanel();
		shopTabbedPane.addTab("상품", null, productPanel, null);
		productPanel.setLayout(new BorderLayout(0, 0));
		
		productTabbedPane = new JTabbedPane(JTabbedPane.TOP);
		productPanel.add(productTabbedPane, BorderLayout.CENTER);
		
		ProductListPanel productListPanel = new ProductListPanel();
		productTabbedPane.addTab("New tab", null, productListPanel, null);
		
		JPanel orderPanel = new JPanel();
		shopTabbedPane.addTab("주문", null, orderPanel, null);
		orderPanel.setLayout(new BorderLayout(0, 0));
		
		orderTabbedPane = new JTabbedPane(JTabbedPane.TOP);
		orderPanel.add(orderTabbedPane, BorderLayout.CENTER);
		
		OrderListPanel orderListPanel = new OrderListPanel();
		orderTabbedPane.addTab("New tab", null, orderListPanel, null);
		
		OrderDetailPanel orderDetailPanel = new OrderDetailPanel();
		orderTabbedPane.addTab("New tab", null, orderDetailPanel, null);
		
		OrderCartPanel orderCartPanel = new OrderCartPanel();
		orderTabbedPane.addTab("New tab", null, orderCartPanel, null);
		
		OrderPaymentPanel orderPaymentPanel = new OrderPaymentPanel();
		orderTabbedPane.addTab("New tab", null, orderPaymentPanel, null);
		
		JPanel logoPanel = new JPanel();
		FlowLayout fl_logoPanel = (FlowLayout) logoPanel.getLayout();
		fl_logoPanel.setVgap(-25);
		fl_logoPanel.setHgap(1);
		logoPanel.setBackground(new Color(253, 236, 166));
		contentPane.add(logoPanel, BorderLayout.NORTH);
		
		JLabel logoLabel = new JLabel("");
		logoLabel.setHorizontalAlignment(SwingConstants.CENTER);
		logoLabel.setIcon(new ImageIcon(CoffeeCrewMainFrame.class.getResource("/image/coffeecrew_logo_yellow.png")));
		logoPanel.add(logoLabel);
		
		/********* 2.CoffeeCrewService멤버필드객체생성(member, product, order, cart) *****/
		
		//memberService = new MemberService();
		//productService = new ProductService();
		//orderService = new OrderService();
		//cartService = new CartService();
		
		/******최초실행시 로그아웃상태로변경******/
		//logoutProcess();
		
		/*
		 * CoffeeCrewMainFrame 참조를 Panel에 넘겨줌
		 */
		// productListPane.setCoffeeCrewMainFrame(this);
		
	}// 생성자끝
	
	/********************* 화면전환메쏘드 *********************************/
	public void changePanel(int top, int sub, Object data) {	//top패널화면, sub패널화면
		
		if (top == TOP_SHOP_MAIN_PANEL) {
			shopTabbedPane.setSelectedIndex(TOP_SHOP_MAIN_PANEL);
		} else if (top == TOP_SHOP_MEMBER_PANEL) {
			shopTabbedPane.setSelectedIndex(TOP_SHOP_MEMBER_PANEL);
			memberTabbedPane.setSelectedIndex(sub);
		} else if (top == TOP_SHOP_PRODUCT_PANEL) {
			shopTabbedPane.setSelectedIndex(TOP_SHOP_PRODUCT_PANEL);
			productTabbedPane.setSelectedIndex(sub);
		} else if (top == TOP_SHOP_ORDER_PANEL) {
			shopTabbedPane.setSelectedIndex(TOP_SHOP_ORDER_PANEL);
			orderTabbedPane.setSelectedIndex(sub);
		}

		
	}
}// 클래스끝



