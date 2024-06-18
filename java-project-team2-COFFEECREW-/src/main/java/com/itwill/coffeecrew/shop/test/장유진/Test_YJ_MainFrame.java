package com.itwill.coffeecrew.shop.test.장유진;

import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Dimension;
import java.awt.EventQueue;
import java.awt.FlowLayout;
import java.awt.Toolkit;
import java.awt.event.FocusAdapter;
import java.awt.event.FocusEvent;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;

import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JMenu;
import javax.swing.JMenuBar;
import javax.swing.JMenuItem;
import javax.swing.JPanel;
import javax.swing.JSeparator;
import javax.swing.JTabbedPane;
import javax.swing.SwingConstants;
import javax.swing.border.EmptyBorder;

import com.itwill.coffeecrew.shop.cart.CartService;
import com.itwill.coffeecrew.shop.member.Member;
import com.itwill.coffeecrew.shop.member.MemberService;
import com.itwill.coffeecrew.shop.order.OrderService;
import com.itwill.coffeecrew.shop.product.ProductService;
import com.itwill.coffeecrew.shop.ui.MemberFindPanel;
import com.itwill.coffeecrew.shop.ui.MemberInfoPanel;
import com.itwill.coffeecrew.shop.ui.MemberJoinPanel;
import com.itwill.coffeecrew.shop.ui.MemberLoginPanel;
import com.itwill.coffeecrew.shop.ui.MainPanel;
import com.itwill.coffeecrew.shop.ui.OrderPaymentPanel;
import com.itwill.coffeecrew.shop.ui.OrderCartPanel;
import com.itwill.coffeecrew.shop.ui.OrderDetailPanel;
import com.itwill.coffeecrew.shop.ui.OrderListPanel;
import com.itwill.coffeecrew.shop.ui.OrderPaymentPanel;
import com.itwill.coffeecrew.shop.ui.ProductDetailPanel;
import com.itwill.coffeecrew.shop.ui.ProductListPanel;
import com.itwill.coffeecrew.shop.ui.OrderCartPanel;

public class Test_YJ_MainFrame extends JFrame {
	private ProductService productService;
	private MemberService memberService;
	private CartService cartService;
	private OrderService orderService;

	private Member loginMember = null;

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
	public static int SUB_ORDER_HISTORY_PANEL = 31;
	public static int SUB_ORDER_DETAIL_PANEL = 32;
	public static int SUB_ORDER_PAYMENT_PANEL = 33;
	public static int SUB_ORDER_CART_PANEL = 34;

	private JPanel contentPane;
	private JMenu mnNewMenu;
	private JMenuItem mnLoginItem;
	private JMenuItem mnLogoutItem;
	private JMenuItem mnExitItem;
	private JTabbedPane shopTabbedPane;
	private JPanel memberPanel;
	private JTabbedPane memberTabbedPane;
	private MainPanel mainPanel;
	private MemberLoginPanel loginPanel;
	private MemberJoinPanel joinPanel;
	private MemberInfoPanel infoPanel;
	private MemberFindPanel findPanel;
	private JPanel productPanel;
	private JTabbedPane productTabbedPane;
	private JPanel orderPanel;
	private JPanel orderListPanel;
	private JTabbedPane orderTabbedPane;
	private OrderPaymentPanel paymentPanel;
	private OrderCartPanel cartPanel;
	private JPanel logoPanel;
	private OrderDetailPanel orderDetailPanel;
	private ProductListPanel productListPanel;
	private ProductDetailPanel productDetailPanel;

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					Test_YJ_MainFrame frame = new Test_YJ_MainFrame();
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
	public Test_YJ_MainFrame() {
		loginMember = new Member("kim1", "1111", "1111", "010-1111-1111", "20000101", "test@naver.com", "테스트");
		setTitle("Coffee Crew");
		setIconImage(
				Toolkit.getDefaultToolkit().getImage(Test_YJ_MainFrame.class.getResource("/image/title_logo_25.png")));
		setResizable(false);
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setBounds(100, 100, 417, 643);

		JMenuBar menuBar = new JMenuBar();
		setJMenuBar(menuBar);

		mnNewMenu = new JMenu("");
		mnNewMenu.setIcon(new ImageIcon(Test_YJ_MainFrame.class.getResource("/image/menu_20.png")));
		menuBar.add(mnNewMenu);

		mnLoginItem = new JMenuItem("로그인");
		mnNewMenu.add(mnLoginItem);

		mnLogoutItem = new JMenuItem("로그아웃");
		mnLogoutItem.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseClicked(MouseEvent e) {
				loginMember = null;
			}
		});
		mnNewMenu.add(mnLogoutItem);

		JSeparator separator = new JSeparator();
		mnNewMenu.add(separator);

		mnExitItem = new JMenuItem("종료");
		mnExitItem.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseClicked(MouseEvent e) {
				System.exit(0);
			}
		});
		mnNewMenu.add(mnExitItem);
		contentPane = new JPanel();
		contentPane.setPreferredSize(new Dimension(10, 600));
		contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));

		setContentPane(contentPane);
		contentPane.setLayout(new BorderLayout(0, 0));

		shopTabbedPane = new JTabbedPane(JTabbedPane.TOP);
		contentPane.add(shopTabbedPane, BorderLayout.CENTER);

		memberPanel = new JPanel();
		memberPanel.setName("");
		memberPanel.setToolTipText("");
		shopTabbedPane.addTab("회원", null, memberPanel, null);
		memberPanel.setLayout(new BorderLayout(0, 0));

		memberTabbedPane = new JTabbedPane(JTabbedPane.TOP);
		memberTabbedPane.setBackground(new Color(240, 240, 240));
		memberPanel.add(memberTabbedPane, BorderLayout.CENTER);

		mainPanel = new MainPanel();
		memberTabbedPane.addTab("메인", null, mainPanel, null);

		loginPanel = new MemberLoginPanel();
		memberTabbedPane.addTab("로그인", null, loginPanel, null);

		joinPanel = new MemberJoinPanel();
		memberTabbedPane.addTab("회원가입", null, joinPanel, null);

		infoPanel = new MemberInfoPanel();
		memberTabbedPane.addTab("회원정보수정", null, infoPanel, null);

		findPanel = new MemberFindPanel();
		memberTabbedPane.addTab("아이디/비밀번호찾기", null, findPanel, null);

		productPanel = new JPanel();
		shopTabbedPane.addTab("상품", null, productPanel, null);
		productPanel.setLayout(new BorderLayout(0, 0));

		productTabbedPane = new JTabbedPane(JTabbedPane.TOP);
		productPanel.add(productTabbedPane, BorderLayout.CENTER);

		productListPanel = new ProductListPanel();
		productTabbedPane.addTab("상품목록", null, productListPanel, null);

		productDetailPanel = new ProductDetailPanel();
		productTabbedPane.addTab("상품상세", null, productDetailPanel, null);

		orderPanel = new JPanel();
		shopTabbedPane.addTab("주문", null, orderPanel, null);
		orderPanel.setLayout(new BorderLayout(0, 0));

		orderTabbedPane = new JTabbedPane(JTabbedPane.TOP);
		orderPanel.add(orderTabbedPane, BorderLayout.CENTER);

		orderListPanel = new OrderListPanel();
		orderTabbedPane.addTab("주문내역", null, orderListPanel, null);

		orderDetailPanel = new OrderDetailPanel();
		orderTabbedPane.addTab("주문상세", null, orderDetailPanel, null);

		paymentPanel = new OrderPaymentPanel();
		orderTabbedPane.addTab("결제하기", null, paymentPanel, null);

		cartPanel = new OrderCartPanel();
		orderTabbedPane.addTab("장바구니", null, cartPanel, null);

		logoPanel = new JPanel();
		FlowLayout fl_logoPanel = (FlowLayout) logoPanel.getLayout();
		fl_logoPanel.setVgap(-25);
		fl_logoPanel.setHgap(1);
		logoPanel.setBackground(new Color(255, 255, 255));
		contentPane.add(logoPanel, BorderLayout.NORTH);

		JLabel logoLabel = new JLabel("");
		logoLabel.setHorizontalAlignment(SwingConstants.CENTER);
		logoLabel.setIcon(new ImageIcon(Test_YJ_MainFrame.class.getResource("/image/logo_new.png")));
		logoPanel.add(logoLabel);

	}

	public void changePanel(int top, int sub, Object data) {
		if (top == TOP_SHOP_MAIN_PANEL) {
			shopTabbedPane.setSelectedIndex(TOP_SHOP_MAIN_PANEL);
		} else if (top == TOP_SHOP_MEMBER_PANEL) {
			memberTabbedPane.setSelectedIndex(sub);
		} else if (top == TOP_SHOP_PRODUCT_PANEL) {
			productTabbedPane.setSelectedIndex(sub);
		} else if (top == TOP_SHOP_ORDER_PANEL) {
			orderTabbedPane.setSelectedIndex(sub);
		}

	}

}
