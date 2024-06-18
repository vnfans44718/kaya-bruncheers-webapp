package com.itwill.coffeecrew.shop.ui;

import javax.swing.JPanel;

import java.awt.Color;
import java.awt.Component;
import java.awt.Cursor;

import javax.swing.JButton;
import javax.swing.border.LineBorder;
import java.awt.BorderLayout;
import java.awt.Dimension;
import javax.swing.JTabbedPane;
import javax.swing.JScrollPane;
import javax.swing.JLabel;
import javax.swing.SwingConstants;
import java.awt.Font;
import javax.swing.ImageIcon;
import javax.swing.event.ChangeListener;

import com.itwill.coffeecrew.shop.product.Product;
import com.itwill.coffeecrew.shop.product.ProductService;

import javax.swing.event.ChangeEvent;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.util.List;

public class ProductListPanel extends JPanel {
	private JPanel productCoffeeListPanel;
	CoffeeCrewMainFrame coffeeCrewMainFrame;
	private JPanel productCoffeeCategoryPanel;
	private JPanel productTeaCategoryPanel;
	private JPanel productSmoothyCategoryPanel;
	private JScrollPane productCoffeeScrollPane;
	private JScrollPane productTeaScrollPane;
	private JScrollPane productSmoothyScrollPane;
	private JButton productOrderButton_0;
	private JTabbedPane productTabbedPane;
	private JPanel productCoffeeContentPanel;
	private JPanel productTeaContentPanel;
	private JPanel productSmoothyContentPanel;
	private JPanel productTeaListPanel;
	private JLabel productImageLabel_0;
	private JLabel productImageLabel_1;
	private JLabel productImageLabel_2;
	private JLabel productNameLabel_0;
	private JLabel productNameLabel_1;
	private JLabel productNameLabel_2;
	private JLabel productPriceLabel_0;
	private JLabel productPriceLabel_1;
	private JLabel productPriceLabel_2;
	private JButton productOrderButton_1;
	private JPanel productSmoothyListPanel;
	private JButton productOrderButton_2;
	private JPanel productCoffeePanel;
	private JLabel productCoffeeImageLabel;
	private JLabel productCoffeeNameLabel;
	private JLabel produdctCoffeePriceLabel;
	private JPanel productTeaPanel;
	private JLabel productTeaImageLabel;
	private JLabel productTeaNameLabel;
	private JLabel productTeaPriceLabel;
	private JPanel productSmoothyPanel;
	private JLabel productSmoothyImageLabel;
	private JLabel productSmoothyNameLabel;
	private JLabel productSmoothyPriceLabel;

	/**
	 * Create the panel.
	 */
	public ProductListPanel() {
		setPreferredSize(new Dimension(380, 450));
		setBorder(new LineBorder(new Color(0, 0, 0), 0));
		setBackground(new Color(255, 255, 255));
		setLayout(new BorderLayout(0, 0));

		productTabbedPane = new JTabbedPane(JTabbedPane.TOP);
		productTabbedPane.addChangeListener(new ChangeListener() {
			public void stateChanged(ChangeEvent e) {
			}
		});
		add(productTabbedPane, BorderLayout.CENTER);

		/* 커피 */
		productCoffeeCategoryPanel = new JPanel();
		productTabbedPane.addTab("커피", null, productCoffeeCategoryPanel, null);
		productCoffeeCategoryPanel.setLayout(new BorderLayout(0, 0));

		productCoffeeScrollPane = new JScrollPane();
		productCoffeeCategoryPanel.add(productCoffeeScrollPane, BorderLayout.CENTER);
		
		productCoffeeContentPanel = new JPanel();
		productCoffeeContentPanel.setPreferredSize(new Dimension(320, 600));
		productCoffeeScrollPane.setViewportView(productCoffeeContentPanel);
		try {
			displayCoffeeProductList();
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		/*
		productImageLabel_0 = new JLabel("");
		

		productImageLabel_0
				.setIcon(new ImageIcon(ProductListPanel.class.getResource("/productImage/size100/아메리카노HOT.jpg")));
		productImageLabel_0.setHorizontalTextPosition(SwingConstants.CENTER);
		productImageLabel_0.setHorizontalAlignment(SwingConstants.CENTER);
		productImageLabel_0.setPreferredSize(new Dimension(35, 35));
		productImageLabel_0.setBorder(new LineBorder(new Color(0, 0, 0)));
		productImageLabel_0.setBounds(0, 0, 100, 100);
		productCoffeeListPanel.add(productImageLabel_0);

		productNameLabel_0 = new JLabel("상품이름");
		productNameLabel_0.setHorizontalAlignment(SwingConstants.LEFT);
		productNameLabel_0.setFont(new Font("맑은 고딕", Font.BOLD, 16));
		productNameLabel_0.setBounds(112, 0, 130, 30);
		productCoffeeListPanel.add(productNameLabel_0);

		productPriceLabel_0 = new JLabel("상품가격");
		productPriceLabel_0.setFont(new Font("맑은 고딕", Font.PLAIN, 12));
		productPriceLabel_0.setHorizontalAlignment(SwingConstants.RIGHT);
		productPriceLabel_0.setBounds(112, 60, 70, 30);
		productCoffeeListPanel.add(productPriceLabel_0);

		productOrderButton_0 = new JButton("주문하기");
		productOrderButton_0.setActionCommand("주문하기");
		productOrderButton_0.setBounds(240, 70, 95, 25);
		productCoffeeListPanel.add(productOrderButton_0);
		*/
		/* 티 */
		productTeaCategoryPanel = new JPanel();
		productTabbedPane.addTab("티", null, productTeaCategoryPanel, null);
		productTeaCategoryPanel.setLayout(new BorderLayout(0, 0));

		productTeaScrollPane = new JScrollPane();
		productTeaCategoryPanel.add(productTeaScrollPane, BorderLayout.CENTER);
		
		productTeaContentPanel = new JPanel();
		productTeaContentPanel.setPreferredSize(new Dimension(320, 600));
		productTeaScrollPane.setViewportView(productTeaContentPanel);

		try {
			displayTeaProductList();
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		/*
		productImageLabel_1 = new JLabel("");
		productImageLabel_1.setIcon(new ImageIcon(ProductListPanel.class.getResource("/productImage/size100/캐모마일HOT.jpg")));
		
		productImageLabel_1.setPreferredSize(new Dimension(35, 35));
		productImageLabel_1.setHorizontalTextPosition(SwingConstants.CENTER);
		productImageLabel_1.setHorizontalAlignment(SwingConstants.CENTER);
		productImageLabel_1.setBorder(new LineBorder(new Color(0, 0, 0)));
		productImageLabel_1.setBounds(0, 0, 100, 100);
		productTeaListPanel.add(productImageLabel_1);

		productNameLabel_1 = new JLabel("상품이름");
		productNameLabel_1.setHorizontalAlignment(SwingConstants.LEFT);
		productNameLabel_1.setFont(new Font("맑은 고딕", Font.BOLD, 16));
		productNameLabel_1.setBounds(112, 0, 130, 30);
		productTeaListPanel.add(productNameLabel_1);

		productPriceLabel_1 = new JLabel("상품가격");
		productPriceLabel_1.setHorizontalAlignment(SwingConstants.RIGHT);
		productPriceLabel_1.setFont(new Font("맑은 고딕", Font.PLAIN, 12));
		productPriceLabel_1.setBounds(112, 60, 70, 30);
		productTeaListPanel.add(productPriceLabel_1);

		productOrderButton_1 = new JButton("주문하기");
		productOrderButton_1.setActionCommand("주문하기");
		productOrderButton_1.setBounds(240, 70, 95, 25);
		productTeaListPanel.add(productOrderButton_1);
		*/
		/* 스무디 */
		productSmoothyCategoryPanel = new JPanel();
		productTabbedPane.addTab("스무디", null, productSmoothyCategoryPanel, null);
		productSmoothyCategoryPanel.setLayout(new BorderLayout(0, 0));

		productSmoothyScrollPane = new JScrollPane();
		productSmoothyCategoryPanel.add(productSmoothyScrollPane, BorderLayout.CENTER);
		
		productSmoothyContentPanel = new JPanel();
		productSmoothyContentPanel.setPreferredSize(new Dimension(320, 600));
		productSmoothyScrollPane.setViewportView(productSmoothyContentPanel);

		try {
			displaySmoothyProductList();
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		/*
		productImageLabel_2 = new JLabel("");
		productImageLabel_2.setIcon(new ImageIcon(ProductListPanel.class.getResource("/productImage/size100/딸기스무디.jpg")));
		productImageLabel_2.setPreferredSize(new Dimension(35, 35));
		productImageLabel_2.setHorizontalTextPosition(SwingConstants.CENTER);
		productImageLabel_2.setHorizontalAlignment(SwingConstants.CENTER);
		productImageLabel_2.setBorder(new LineBorder(new Color(0, 0, 0)));
		productImageLabel_2.setBounds(0, 0, 100, 100);
		productSmoothyListPanel.add(productImageLabel_2);

		productNameLabel_2 = new JLabel("상품이름");
		productNameLabel_2.setHorizontalAlignment(SwingConstants.LEFT);
		productNameLabel_2.setFont(new Font("맑은 고딕", Font.BOLD, 16));
		productNameLabel_2.setBounds(112, 0, 130, 30);
		productSmoothyListPanel.add(productNameLabel_2);

		productPriceLabel_2 = new JLabel("상품가격");
		productPriceLabel_2.setHorizontalAlignment(SwingConstants.RIGHT);
		productPriceLabel_2.setFont(new Font("맑은 고딕", Font.PLAIN, 12));
		productPriceLabel_2.setBounds(112, 60, 70, 30);
		productSmoothyListPanel.add(productPriceLabel_2);

		productOrderButton_2 = new JButton("주문하기");
		productOrderButton_2.setActionCommand("주문하기");
		productOrderButton_2.setBounds(240, 70, 95, 25);
		productSmoothyListPanel.add(productOrderButton_2);
		 */
	}// 생성자 끝

	//커피 카테고리 출력
	private void displayCoffeeProductList() throws Exception {
		productCoffeeContentPanel.removeAll();
		ProductService productService = new ProductService();
		List<Product> productList = productService.productListByCategory("커피");
		
		productCoffeeListPanel = new JPanel();
		productCoffeeListPanel.setBorder(new LineBorder(new Color(0, 0, 0)));
		productCoffeeListPanel.setPreferredSize(new Dimension(340, 100));
//		productCoffeeContentPanel.add(productCoffeeListPanel);
		productCoffeeListPanel.setLayout(null);
		for (Product product : productList) {

			productCoffeePanel = new JPanel();
			productCoffeePanel.setBorder(new LineBorder(new Color(0, 0, 0)));
			productCoffeePanel.setPreferredSize(new Dimension(340, 100));
			productCoffeePanel.setLayout(null);

			productCoffeeImageLabel = new JLabel("");
			productCoffeeImageLabel.setIcon(new ImageIcon(
					CoffeeCrewMainFrame.class.getResource("/productImage/size100/" + product.getPName() + ".jpg")));
			productCoffeeImageLabel.addMouseListener(new MouseAdapter() {
				@Override
				public void mouseClicked(MouseEvent e) {
					coffeeCrewMainFrame.changePanel(CoffeeCrewMainFrame.TOP_SHOP_PRODUCT_PANEL,
							CoffeeCrewMainFrame.SUB_ORDER_DETAIL_PANEL, product);
					System.out.println(product);
				}
			});
			productCoffeeImageLabel.setHorizontalTextPosition(SwingConstants.CENTER);
			productCoffeeImageLabel.setHorizontalAlignment(SwingConstants.CENTER);
			productCoffeeImageLabel.setPreferredSize(new Dimension(35, 35));
			productCoffeeImageLabel.setBorder(new LineBorder(new Color(0, 0, 0)));
			productCoffeeImageLabel.setBounds(0, 0, 100, 100);
			productCoffeePanel.add(productCoffeeImageLabel);

			productCoffeeNameLabel = new JLabel(product.getPName());
			productCoffeeNameLabel.setHorizontalAlignment(SwingConstants.LEFT);
			productCoffeeNameLabel.setFont(new Font("맑은 고딕", Font.BOLD, 16));
			productCoffeeNameLabel.setBounds(112, 0, 130, 30);
			productCoffeePanel.add(productCoffeeNameLabel);

			produdctCoffeePriceLabel = new JLabel(product.getPPrice() + " 원");
			produdctCoffeePriceLabel.setFont(new Font("맑은 고딕", Font.PLAIN, 12));
			produdctCoffeePriceLabel.setHorizontalAlignment(SwingConstants.RIGHT);
			produdctCoffeePriceLabel.setBounds(112, 60, 70, 30);
			productCoffeePanel.add(produdctCoffeePriceLabel);

			productCoffeeContentPanel.add(productCoffeePanel);
			
		}
	}

	private void displayTeaProductList() throws Exception {
		productTeaContentPanel.removeAll();
		ProductService productService = new ProductService();
		List<Product> productList = productService.productListByCategory("티");
		
		productTeaListPanel = new JPanel();
		productTeaListPanel.setBorder(new LineBorder(new Color(0, 0, 0)));
		productTeaListPanel.setPreferredSize(new Dimension(340, 100));
//		productTeaContentPanel.add(productTeaListPanel);
		productTeaListPanel.setLayout(null);
		for (Product product : productList) {

			productTeaPanel = new JPanel();
			productTeaPanel.setLayout(null);
			productTeaPanel.setPreferredSize(new Dimension(340, 100));
			productTeaPanel.setBorder(new LineBorder(new Color(0, 0, 0)));
			productTeaPanel.setBounds(0, 0, 340, 100);
			productTeaContentPanel.add(productTeaPanel);

			productTeaImageLabel = new JLabel("");
			productTeaImageLabel.setIcon(new ImageIcon(
					CoffeeCrewMainFrame.class.getResource("/productImage/size100/" + product.getPName() + ".jpg")));
			
			productTeaImageLabel.setHorizontalTextPosition(SwingConstants.CENTER);
			productTeaImageLabel.setHorizontalAlignment(SwingConstants.CENTER);
			productTeaImageLabel.setPreferredSize(new Dimension(35, 35));
			productTeaImageLabel.setBorder(new LineBorder(new Color(0, 0, 0)));
			productTeaImageLabel.setBounds(0, 0, 100, 100);
			productTeaPanel.add(productTeaImageLabel);

			productTeaNameLabel = new JLabel(product.getPName());
			productTeaNameLabel.setHorizontalAlignment(SwingConstants.LEFT);
			productTeaNameLabel.setFont(new Font("맑은 고딕", Font.BOLD, 16));
			productTeaNameLabel.setBounds(112, 0, 130, 30);
			productTeaPanel.add(productTeaNameLabel);

			productTeaPriceLabel = new JLabel(product.getPPrice() + " 원");
			productTeaPriceLabel.setFont(new Font("맑은 고딕", Font.PLAIN, 12));
			productTeaPriceLabel.setHorizontalAlignment(SwingConstants.RIGHT);
			productTeaPriceLabel.setBounds(112, 60, 70, 30);
			productTeaPanel.add(productTeaPriceLabel);

			productTeaContentPanel.add(productTeaPanel);
		}
	}

	private void displaySmoothyProductList() throws Exception {
		productSmoothyContentPanel.removeAll();
		ProductService productService = new ProductService();
		List<Product> productList = productService.productListByCategory("스무디");
		productSmoothyListPanel = new JPanel();
		productSmoothyListPanel.setLayout(null);
		productSmoothyListPanel.setPreferredSize(new Dimension(340, 100));
		productSmoothyListPanel.setBorder(new LineBorder(new Color(0, 0, 0)));
		productSmoothyListPanel.setBounds(0, 0, 340, 100);
//		productSmoothyContentPanel.add(productSmoothyListPanel);
		
		for (Product product : productList) {

			productSmoothyPanel = new JPanel();
			productSmoothyPanel.setBorder(new LineBorder(new Color(0, 0, 0)));
			productSmoothyPanel.setPreferredSize(new Dimension(340, 100));
			productSmoothyPanel.setLayout(null);

			productSmoothyImageLabel = new JLabel("");

			productSmoothyImageLabel.setIcon(new ImageIcon(CoffeeCrewMainFrame.class.getResource("/productImage/size100/" + product.getPName() + ".jpg")));
			productSmoothyImageLabel.setHorizontalTextPosition(SwingConstants.CENTER);
			productSmoothyImageLabel.setHorizontalAlignment(SwingConstants.CENTER);
			productSmoothyImageLabel.setPreferredSize(new Dimension(35, 35));
			productSmoothyImageLabel.setBorder(new LineBorder(new Color(0, 0, 0)));
			productSmoothyImageLabel.setBounds(0, 0, 100, 100);
			productSmoothyPanel.add(productSmoothyImageLabel);

			productSmoothyNameLabel = new JLabel(product.getPName());
			productSmoothyNameLabel.setHorizontalAlignment(SwingConstants.LEFT);
			productSmoothyNameLabel.setFont(new Font("맑은 고딕", Font.BOLD, 16));
			productSmoothyNameLabel.setBounds(112, 0, 130, 30);
			productSmoothyPanel.add(productSmoothyNameLabel);

			productSmoothyPriceLabel = new JLabel(product.getPPrice() + " 원");
			productSmoothyPriceLabel.setFont(new Font("맑은 고딕", Font.PLAIN, 12));
			productSmoothyPriceLabel.setHorizontalAlignment(SwingConstants.RIGHT);
			productSmoothyPriceLabel.setBounds(112, 60, 70, 30);
			productSmoothyPanel.add(productSmoothyPriceLabel);

			productSmoothyContentPanel.add(productSmoothyPanel);
		}
	}
	
	public void setCoffeeCrewMainFrame(CoffeeCrewMainFrame coffeeCrewMainFrame) {
		this.coffeeCrewMainFrame = coffeeCrewMainFrame;
	}
	
}