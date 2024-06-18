package com.itwill.coffeecrew.shop.ui;

import java.awt.EventQueue;

import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.border.EmptyBorder;
import javax.swing.table.DefaultTableModel;

import com.itwill.coffeecrew.shop.cart.Cart;
import com.itwill.coffeecrew.shop.cart.CartService;
import com.itwill.coffeecrew.shop.member.Member;
import com.itwill.coffeecrew.shop.member.MemberService;
import com.itwill.coffeecrew.shop.order.Order;
import com.itwill.coffeecrew.shop.order.OrderService;
import com.itwill.coffeecrew.shop.product.Product;
import com.itwill.coffeecrew.shop.product.ProductService;

import java.awt.BorderLayout;
import javax.swing.JTabbedPane;
import javax.swing.JMenuBar;
import javax.swing.JMenuItem;
import javax.swing.JOptionPane;
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
import javax.swing.event.ChangeListener;
import javax.swing.event.ChangeEvent;

public class CoffeeCrewMainFrame extends JFrame {
	/***** 1.로그인한 Member객체, 주문중인 Order객체 멤버필드 선언 **********/
	Member loginMember=null;
	Order tempOrder=null;
	/***** 2.패널상수선언 *******************************************/
	public static int TOP_SHOP_MAIN_PANEL = 0;
	public static int TOP_SHOP_MEMBER_PANEL = 1;
	public static int TOP_SHOP_PRODUCT_PANEL = 2;
	public static int TOP_SHOP_ORDER_PANEL = 3;

	public static int SUB_MEMBER_LOGIN_PANEL = 0;
	public static int SUB_MEMBER_JOIN_PANEL = 1;
	public static int SUB_MEMBER_INFO_PANEL = 2;
	public static int SUB_MEMBER_FIND_PANEL = 3;
	
	public static int SUB_PRODUCT_LIST_PANEL = 0;
	public static int SUB_PRODUCT_DETAIL_PANEL = 1;

	public static int SUB_ORDER_LIST_PANEL = 0;
	public static int SUB_ORDER_DETAIL_PANEL = 1;
	public static int SUB_ORDER_PAYMENT_PANEL = 2;
	public static int SUB_ORDER_CART_PANEL = 3;

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
	private OrderDetailPanel orderDetailPanel;
	private MemberLoginPanel memberLoginPanel;
	private MemberInfoPanel memberInfoPanel;
	private ProductDetailPanel productDetailPanel;
	private ProductListPanel productListPanel;
	private OrderListPanel orderListPanel;

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
		/****** 최초실행시 로그아웃상태로변경 ******/
		
		
		setTitle("Coffee Crew");
		setIconImage(Toolkit.getDefaultToolkit()
				.getImage(CoffeeCrewMainFrame.class.getResource("/image/title_logo_25.png")));
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
				shopTabbedPane.setSelectedIndex(1);
				memberTabbedPane.setSelectedIndex(0);
			}
		});
		tabMenu.add(loginMenuItem);

		joinMenuItem = new JMenuItem("회원가입");
		joinMenuItem.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				//회원가입화면
				shopTabbedPane.setSelectedIndex(1);
				memberTabbedPane.setSelectedIndex(1);
			}
		});
		tabMenu.add(joinMenuItem);

		logoutMenuItem = new JMenuItem("로그아웃");
		logoutMenuItem.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				//로그아웃시 로그인화면
				//memberTabbedPane.setSelectedIndex(1);
				logoutProcess();
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
		shopTabbedPane.addChangeListener(new ChangeListener() {
			public void stateChanged(ChangeEvent e) {
				if (loginMember!=null&&shopTabbedPane.getSelectedIndex() == TOP_SHOP_ORDER_PANEL) {
					orderListPanel.displayOrderList(loginMember);
				}
			}
		});
		
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
		productListButton.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				shopTabbedPane.setSelectedIndex(2);
				productTabbedPane.setSelectedIndex(0);
			}
		});
		productListButton.setFont(new Font("맑은 고딕", Font.PLAIN, 12));
		mainButtonPanel.add(productListButton);

		JButton orderListButton = new JButton("주문내역");
		orderListButton.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				if (loginMember != null) {
					shopTabbedPane.setSelectedIndex(3);
					orderTabbedPane.setSelectedIndex(0);
				} else {
					JOptionPane.showMessageDialog(null, "로그인을 해주세요");
					changePanel(TOP_SHOP_MEMBER_PANEL, SUB_MEMBER_LOGIN_PANEL, null);
				}
			}
		});
		orderListButton.setFont(new Font("맑은 고딕", Font.PLAIN, 12));
		mainButtonPanel.add(orderListButton);

		JButton orderCartButton = new JButton("장바구니");
		orderCartButton.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				if (loginMember != null) {
					shopTabbedPane.setSelectedIndex(3);
					orderTabbedPane.setSelectedIndex(2);
				} else {
					JOptionPane.showMessageDialog(null, "로그인을 해주세요");
					changePanel(TOP_SHOP_MEMBER_PANEL, SUB_MEMBER_LOGIN_PANEL, null);
				}
			}
		});
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

		MemberLoginPanel memberLoginPanel = new MemberLoginPanel();
		memberLoginPanel.setFont(new Font("맑은 고딕", Font.PLAIN, 12));
		memberTabbedPane.addTab("로그인", null, memberLoginPanel, null);

		MemberJoinPanel memberJoinPanel = new MemberJoinPanel();
		memberJoinPanel.setFont(new Font("맑은 고딕", Font.PLAIN, 12));
		memberTabbedPane.addTab("회원가입", null, memberJoinPanel, null);

		MemberInfoPanel memberInfoPanel = new MemberInfoPanel();
		memberInfoPanel.setFont(new Font("맑은 고딕", Font.PLAIN, 12));
		memberTabbedPane.addTab("회원정보수정", null, memberInfoPanel, null);

		MemberFindPanel memberFindPanel = new MemberFindPanel();
		memberFindPanel.setFont(new Font("맑은 고딕", Font.PLAIN, 12));
		memberTabbedPane.addTab("아이디/비밀번호찾기", null, memberFindPanel, null);

		JPanel productPanel = new JPanel();
		shopTabbedPane.addTab("상품", null, productPanel, null);
		productPanel.setLayout(new BorderLayout(0, 0));

		productTabbedPane = new JTabbedPane(JTabbedPane.TOP);
		productPanel.add(productTabbedPane, BorderLayout.CENTER);

		productListPanel = new ProductListPanel();
		productTabbedPane.addTab("상품목록", null, productListPanel, null);

		productDetailPanel = new ProductDetailPanel();
		productTabbedPane.addTab("상품상세", null, productDetailPanel, null);

		JPanel orderPanel = new JPanel();
		shopTabbedPane.addTab("주문", null, orderPanel, null);
		orderPanel.setLayout(new BorderLayout(0, 0));

		orderTabbedPane = new JTabbedPane(JTabbedPane.TOP);
		if (loginMember != null) {
			orderTabbedPane.addChangeListener(new ChangeListener() {
				public void stateChanged(ChangeEvent e) {
					if (orderTabbedPane.getSelectedIndex() == SUB_ORDER_LIST_PANEL) {
						orderListPanel.displayOrderList(loginMember);
					}
				}
			});
		}
		orderPanel.add(orderTabbedPane, BorderLayout.CENTER);

		orderListPanel = new OrderListPanel();
		orderTabbedPane.addTab("주문내역", null, orderListPanel, null);

		orderDetailPanel = new OrderDetailPanel();
		orderTabbedPane.addTab("주문상세", null, orderDetailPanel, null);

		OrderCartPanel orderCartPanel = new OrderCartPanel();
		orderTabbedPane.addTab("장바구니", null, orderCartPanel, null);

		OrderPaymentPanel orderPaymentPanel = new OrderPaymentPanel();
		orderTabbedPane.addTab("결제하기", null, orderPaymentPanel, null);

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

		/*
		 * CoffeeCrewMainFrame 참조를 Panel에 넘겨줌
		 */
		// productListPane.setCoffeeCrewMainFrame(this);
		memberLoginPanel.setCoffeeCrewMainFrame(this);
		memberInfoPanel.setCoffeeCrewMainFrame(this);
		orderListPanel.setCoffeeCrewMainFrame(this);
		productDetailPanel.setCoffeeCrewMainFrame(this);
		productListPanel.setCoffeeCrewMainFrame(this);
		
		logoutProcess();
		
	}// 생성자끝

	/********************* 화면전환메쏘드 *********************************/
	public void changePanel(int top, int sub, Object data) { //top패널화면, sub패널화면
		
		if (top == TOP_SHOP_MAIN_PANEL) {
			shopTabbedPane.setSelectedIndex(top);
		} else if (top == TOP_SHOP_MEMBER_PANEL) {
			shopTabbedPane.setSelectedIndex(top);
			memberTabbedPane.setSelectedIndex(sub);

		} else if (top == TOP_SHOP_PRODUCT_PANEL) {
			productTabbedPane.setSelectedIndex(sub);
			
			if (sub == SUB_PRODUCT_DETAIL_PANEL) {
				try {
					productDetailPanel.displayProductDetails((Product) data);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}			
			shopTabbedPane.setSelectedIndex(0);
			shopTabbedPane.setSelectedIndex(top);
			
			
		}
			else if (top == TOP_SHOP_ORDER_PANEL) {
			orderTabbedPane.setSelectedIndex(sub);
			if (sub == SUB_ORDER_DETAIL_PANEL) {
				orderDetailPanel.displayOrderItemList((Order) data);
				
			}
		}
	}

	/**************로그아웃시 호출할메쏘드***************/
	public void logoutProcess() {
		this.loginMember = null;
		setTitle("Coffee Crew");
		shopTabbedPane.setEnabledAt(3, false); // 주문 탭
		memberTabbedPane.setEnabledAt(0, true); //로그인탭 활성화
		memberTabbedPane.setEnabledAt(1, true); //회원가입탭 활성화
		memberTabbedPane.setEnabledAt(2, true); //회원정보탭 불활성화
		memberTabbedPane.setEnabledAt(3, true); //아이디/비밀번호찾기탭 불활성화

		loginMenuItem.setEnabled(true); //로그인 메뉴아이템 활성화
		joinMenuItem.setEnabled(true); //회원가입 메뉴아이템 활성화
		logoutMenuItem.setEnabled(false); //로그아웃 메뉴아이템 불활성화
		

		shopTabbedPane.setSelectedIndex(1);
		memberTabbedPane.setSelectedIndex(0);
	}

	
	public void loginProcess(Member loginMember) {
		this.loginMember = loginMember;
		
	}

}// 클래스끝




