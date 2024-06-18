package com.itwill.coffeecrew.shop.test.송성빈;

import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Cursor;
import java.awt.Dimension;
import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.ItemEvent;
import java.awt.event.ItemListener;
import java.awt.event.KeyEvent;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.text.DecimalFormat;

import javax.swing.DefaultComboBoxModel;
import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JRadioButton;
import javax.swing.SwingConstants;
import javax.swing.border.LineBorder;

import com.itwill.coffeecrew.shop.cart.Cart;
import com.itwill.coffeecrew.shop.cart.CartService;
import com.itwill.coffeecrew.shop.member.Member;
import com.itwill.coffeecrew.shop.product.Product;
import com.itwill.coffeecrew.shop.product.ProductService;

public class ProductDetailPanel extends JPanel {
	CoffeeCrewMainFrame coffeeCrewMainFrame;
	private JComboBox productDetailcomboBox;
	private JButton productDetailPriceLabel;
	private JPanel productDetailPanel;
	Product product;
	CartService cartService;
	Cart cart;
	ProductService productService;

	/**
	 * Create the panel.
	 */
	public ProductDetailPanel() {
		setPreferredSize(new Dimension(380, 450));
		setBorder(new LineBorder(new Color(0, 0, 0), 0));
		setBackground(new Color(255, 255, 255));
		setLayout(new BorderLayout(0, 0));

		JPanel productDetailPanel = new JPanel();
		productDetailPanel.setPreferredSize(new Dimension(380, 450));
		add(productDetailPanel, BorderLayout.WEST);
		productDetailPanel.setLayout(null);

		JLabel productDetailImageLabel = new JLabel("");
		productDetailImageLabel
				.setIcon(new ImageIcon(ProductDetailPanel.class.getResource("/productImage/size150/아메리카노HOT.jpg")));
		productDetailImageLabel.setHorizontalTextPosition(SwingConstants.CENTER);
		productDetailImageLabel.setHorizontalAlignment(SwingConstants.CENTER);
		productDetailImageLabel.setBorder(new LineBorder(new Color(0, 0, 0)));
		productDetailImageLabel.setBounds(115, 10, 150, 150);
		productDetailPanel.add(productDetailImageLabel);

		JLabel productDetailNameLabel = new JLabel("");
		productDetailNameLabel.setPreferredSize(new Dimension(60, 30));
		productDetailNameLabel.setHorizontalAlignment(SwingConstants.CENTER);
		productDetailNameLabel.setFont(new Font("맑은 고딕", Font.BOLD, 16));
		productDetailNameLabel.setBounds(115, 180, 150, 30);
		productDetailPanel.add(productDetailNameLabel);

		JLabel productDetailPriceLabel = new JLabel("");
		productDetailPriceLabel.setVerticalAlignment(SwingConstants.BOTTOM);
		productDetailPriceLabel.setHorizontalAlignment(SwingConstants.RIGHT);
		productDetailPriceLabel.setFont(new Font("맑은 고딕", Font.BOLD, 12));
		productDetailPriceLabel.setBounds(177, 278, 90, 30);
		productDetailPanel.add(productDetailPriceLabel);

		productDetailcomboBox = new JComboBox();
		productDetailcomboBox
				.setModel(new DefaultComboBoxModel(new String[] { "1", "2", "3", "4", "5", "6", "7", "8", "9", "10" }));
		productDetailcomboBox.setToolTipText("");
		productDetailcomboBox.setMaximumRowCount(10);
		productDetailcomboBox.setBounds(115, 280, 50, 30);
		productDetailPanel.add(productDetailcomboBox);
		productDetailcomboBox.addItemListener(new ItemListener() {
			Product p = product;

			public void itemStateChanged(ItemEvent e) {
				if (e.getStateChange() == ItemEvent.SELECTED) {
					try {
						String productSelectedQtyStr = (String) productDetailcomboBox.getSelectedItem();
						int productSelectedQty = Integer.parseInt(productSelectedQtyStr);
						int updateProductCount = cartService.updateCart(p.getPNo(), productSelectedQty);

						productDetailPriceLabel
								.setText(new DecimalFormat("#,###").format(p.getPPrice() * productSelectedQty));
					} catch (Exception e1) {
						e1.printStackTrace();
					}
				}
			}
		});

		JLabel productDetailCartLabel = new JLabel("");
		productDetailCartLabel
				.setIcon(new ImageIcon(ProductDetailPanel.class.getResource("/productImage/카트이미지 (50).png")));
		productDetailCartLabel.setPreferredSize(new Dimension(50, 50));
		productDetailCartLabel.setDisplayedMnemonic(KeyEvent.VK_ENTER);
		productDetailCartLabel.setBounds(160, 320, 50, 50);
		productDetailPanel.add(productDetailCartLabel);

		JLabel productSelectHotLabel = new JLabel("HOT");
		productSelectHotLabel.setVerticalAlignment(SwingConstants.TOP);
		productSelectHotLabel.setHorizontalAlignment(SwingConstants.CENTER);
		productSelectHotLabel.setForeground(Color.RED);
		productSelectHotLabel.setFont(new Font("맑은 고딕", Font.BOLD, 12));
		productSelectHotLabel.setBounds(115, 234, 35, 23);
		productDetailPanel.add(productSelectHotLabel);

		JLabel productSeletICELabel = new JLabel("ICE");
		productSeletICELabel.setVerticalAlignment(SwingConstants.TOP);
		productSeletICELabel.setHorizontalAlignment(SwingConstants.CENTER);
		productSeletICELabel.setForeground(Color.BLUE);
		productSeletICELabel.setFont(new Font("맑은 고딕", Font.BOLD, 12));
		productSeletICELabel.setBounds(200, 234, 35, 23);
		productDetailPanel.add(productSeletICELabel);

		JRadioButton productSelectHotJRB = new JRadioButton("");
		productSelectHotJRB.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
			}
		});
		productSelectHotJRB.setVerticalAlignment(SwingConstants.TOP);
		productSelectHotJRB.setSelected(false);
		productSelectHotJRB.setBounds(147, 234, 23, 23);
		productDetailPanel.add(productSelectHotJRB);

		JRadioButton productSelectICEJRB = new JRadioButton("");
		productSelectICEJRB.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
			}
		});
		productSelectICEJRB.setVerticalAlignment(SwingConstants.TOP);
		productSelectICEJRB.setSelected(false);
		productSelectICEJRB.setBounds(230, 234, 23, 23);
		productDetailPanel.add(productSelectICEJRB);

		JButton productCartBtn = new JButton("장바구니로 이동");

		productCartBtn.addActionListener(new ActionListener() {

			public void actionPerformed(ActionEvent e) {
				Product p = new Product();
				Member loginMember = coffeeCrewMainFrame.loginMember;
				CartService cartService;
				try {
					cartService = new CartService();

					if (loginMember != null) {
						// 로그인했을때
						/****************** 카트에담기 ***************/
						try {
							String cartQtyStr = (String) productDetailcomboBox.getSelectedItem();
							int cartQty = Integer.parseInt(cartQtyStr);
							Cart addCartItem = new Cart(0, loginMember, product, cartQty);

							int addCount = cartService.addCart(loginMember.getId(), p.getPNo(), cartQty);
							// 카트수량아이콘변경
							int cartItemCount = cartService.getCartItemByUserId(loginMember.getId()).size();

							// 메세지출력
							JOptionPane.showMessageDialog(null, "장바구니에 제품이담겼습니다");

						} catch (Exception ex) {
							ex.printStackTrace();
						}

					}
					/*******************************************/

					coffeeCrewMainFrame.changePanel(coffeeCrewMainFrame.TOP_SHOP_ORDER_PANEL,
							coffeeCrewMainFrame.SUB_ORDER_CART_PANEL, product.getPNo());
//					coffeeCrewMainFrame.changePanel(3, 34, null);
				} catch (Exception e1) {
					e1.printStackTrace();
				}
			}
		});
		productCartBtn.setBounds(120, 390, 140, 30);
		productDetailPanel.add(productCartBtn);

	}// 생성자끝

	public void displayProductDetails(Product product) throws Exception {
		productService = new ProductService();
		product = productService.productDetail(product.getPNo());

		productDetailPanel.removeAll();

		JPanel productDetailPanel = new JPanel();
		productDetailPanel.setPreferredSize(new Dimension(380, 450));
		add(productDetailPanel, BorderLayout.WEST);
		productDetailPanel.setLayout(null);

		JLabel productDetailImageLabel = new JLabel("");
		productDetailImageLabel.setIcon(new ImageIcon(
				ProductDetailPanel.class.getResource("/productImage/size150/" + product.getPName() + ".jpg")));
		productDetailImageLabel.setHorizontalTextPosition(SwingConstants.CENTER);
		productDetailImageLabel.setHorizontalAlignment(SwingConstants.CENTER);
		productDetailImageLabel.setBorder(new LineBorder(new Color(0, 0, 0)));
		productDetailImageLabel.setBounds(115, 10, 150, 150);
		productDetailPanel.add(productDetailImageLabel);

		JLabel productDetailNameLabel = new JLabel(product.getPName());
		productDetailNameLabel.setPreferredSize(new Dimension(60, 30));
		productDetailNameLabel.setHorizontalAlignment(SwingConstants.CENTER);
		productDetailNameLabel.setFont(new Font("맑은 고딕", Font.BOLD, 16));
		productDetailNameLabel.setBounds(115, 180, 150, 30);
		productDetailPanel.add(productDetailNameLabel);

		JLabel productDetailPriceLabel = new JLabel(product.getPPrice() + " 원");
		productDetailPriceLabel.setVerticalAlignment(SwingConstants.BOTTOM);
		productDetailPriceLabel.setHorizontalAlignment(SwingConstants.RIGHT);
		productDetailPriceLabel.setFont(new Font("맑은 고딕", Font.BOLD, 12));
		productDetailPriceLabel.setBounds(177, 278, 90, 30);
		productDetailPanel.add(productDetailPriceLabel);

		JComboBox productDetailcomboBox = new JComboBox();
		productDetailcomboBox
				.setModel(new DefaultComboBoxModel(new String[] { "1", "2", "3", "4", "5", "6", "7", "8", "9", "10" }));
		productDetailcomboBox.setToolTipText("");
		productDetailcomboBox.setMaximumRowCount(10);
		productDetailcomboBox.setBounds(115, 280, 50, 30);
		productDetailcomboBox.setSelectedItem(cart.getCQty() + "");
		productDetailcomboBox.addItemListener(new ItemListener() {
			Product product = new Product();

			public void itemStateChanged(ItemEvent e) {
				if (e.getStateChange() == ItemEvent.SELECTED) {
					try {
						String productSeletedQtyStr = (String) productDetailcomboBox.getSelectedItem();
						int productSelectedQty = Integer.parseInt(productSeletedQtyStr);
						int updateProductCount = cartService.updateCart(product.getPNo(), productSelectedQty);
						productDetailPriceLabel
								.setText(new DecimalFormat("#,###").format(product.getPPrice() * productSelectedQty));
						// updatePrice();
					} catch (Exception ex) {
						ex.printStackTrace();
					}
				}
			}
		});
		productDetailPanel.add(productDetailcomboBox);

		JLabel productDetailCartLabel = new JLabel("");
		productDetailCartLabel
				.setIcon(new ImageIcon(ProductDetailPanel.class.getResource("/productImage/카트이미지 (50).png")));
		productDetailCartLabel.setPreferredSize(new Dimension(50, 50));
		productDetailCartLabel.setDisplayedMnemonic(KeyEvent.VK_ENTER);
		productDetailCartLabel.setBounds(160, 320, 50, 50);
		productDetailPanel.add(productDetailCartLabel);

		JLabel productSelectHotLabel = new JLabel("HOT");
		productSelectHotLabel.setVerticalAlignment(SwingConstants.TOP);
		productSelectHotLabel.setHorizontalAlignment(SwingConstants.CENTER);
		productSelectHotLabel.setForeground(Color.RED);
		productSelectHotLabel.setFont(new Font("맑은 고딕", Font.BOLD, 12));
		productSelectHotLabel.setBounds(115, 234, 35, 23);
		productDetailPanel.add(productSelectHotLabel);

		JLabel productSeletICELabel = new JLabel("ICE");
		productSeletICELabel.setVerticalAlignment(SwingConstants.TOP);
		productSeletICELabel.setHorizontalAlignment(SwingConstants.CENTER);
		productSeletICELabel.setForeground(Color.BLUE);
		productSeletICELabel.setFont(new Font("맑은 고딕", Font.BOLD, 12));
		productSeletICELabel.setBounds(200, 234, 35, 23);
		productDetailPanel.add(productSeletICELabel);

		JRadioButton productSelectHotJRB = new JRadioButton("");
		productSelectHotJRB.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
			}
		});
		productSelectHotJRB.setVerticalAlignment(SwingConstants.TOP);
		productSelectHotJRB.setSelected(false);
		productSelectHotJRB.setBounds(147, 234, 23, 23);
		productDetailPanel.add(productSelectHotJRB);

		JRadioButton productSelectICEJRB = new JRadioButton("");
		productSelectICEJRB.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
			}
		});
		productSelectICEJRB.setVerticalAlignment(SwingConstants.TOP);
		productSelectICEJRB.setSelected(false);
		productSelectICEJRB.setBounds(230, 234, 23, 23);
		productDetailPanel.add(productSelectICEJRB);

		JButton productCartBtn = new JButton("장바구니로 이동");

		productCartBtn.setBounds(120, 390, 140, 30);
		productDetailPriceLabel.add(productCartBtn);
		productDetailPanel.add(productCartBtn);

	}

	public void setCoffeeCrewMainFrame(CoffeeCrewMainFrame coffeeCrewMainFrame) {
		this.coffeeCrewMainFrame = coffeeCrewMainFrame;
	}
}
