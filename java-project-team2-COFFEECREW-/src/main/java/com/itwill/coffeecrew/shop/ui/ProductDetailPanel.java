package com.itwill.coffeecrew.shop.ui;

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
	private JLabel productDetailPriceLabel;
	
	private JLabel productDetailNameLabel;
	private JLabel productDetailImageLabel;
	private JPanel productDetailPanel;
	private JButton productCartBtn;

	/**
	 * Create the panel.
	 */
	public ProductDetailPanel() {
		setPreferredSize(new Dimension(380, 450));
		setBorder(new LineBorder(new Color(0, 0, 0), 0));
		setBackground(new Color(255, 255, 255));
		setLayout(new BorderLayout(0, 0));
		
		productDetailPanel = new JPanel();
		productDetailPanel.setPreferredSize(new Dimension(380, 450));
		add(productDetailPanel, BorderLayout.WEST);
		productDetailPanel.setLayout(null);

		productDetailImageLabel = new JLabel("");
		productDetailImageLabel
				.setIcon(new ImageIcon(ProductDetailPanel.class.getResource("/productImage/size150/아메리카노HOT.jpg")));
		productDetailImageLabel.setHorizontalTextPosition(SwingConstants.CENTER);
		productDetailImageLabel.setHorizontalAlignment(SwingConstants.CENTER);
		productDetailImageLabel.setBorder(new LineBorder(new Color(0, 0, 0)));
		productDetailImageLabel.setBounds(115, 10, 150, 150);
		productDetailPanel.add(productDetailImageLabel);

		productDetailNameLabel = new JLabel("");
		productDetailNameLabel.setPreferredSize(new Dimension(60, 30));
		productDetailNameLabel.setHorizontalAlignment(SwingConstants.CENTER);
		productDetailNameLabel.setFont(new Font("맑은 고딕", Font.BOLD, 16));
		productDetailNameLabel.setBounds(115, 180, 150, 30);
		productDetailPanel.add(productDetailNameLabel);

		productDetailPriceLabel = new JLabel("");
		productDetailPriceLabel.setVerticalAlignment(SwingConstants.BOTTOM);
		productDetailPriceLabel.setHorizontalAlignment(SwingConstants.RIGHT);
		productDetailPriceLabel.setFont(new Font("맑은 고딕", Font.BOLD, 12));
		productDetailPriceLabel.setBounds(177, 278, 90, 30);
		productDetailPanel.add(productDetailPriceLabel);

		productDetailcomboBox = new JComboBox();
		productDetailcomboBox
				.setModel(new DefaultComboBoxModel(new String[] { "1", "2", "3", "4", "5", "6", "7", "8", "9", "10" }));
		productDetailcomboBox.addItemListener(new ItemListener() {
			public void itemStateChanged(ItemEvent e) {
				if (e.getStateChange() == ItemEvent.SELECTED) {
					updatePrice();
				}
			}
		});
		productDetailcomboBox.setToolTipText("");
		productDetailcomboBox.setMaximumRowCount(10);
		productDetailcomboBox.setBounds(115, 280, 50, 30);
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
		productCartBtn = new JButton("장바구니로 이동");
		
		productCartBtn.setBounds(120, 390, 140, 30);
		productDetailPanel.add(productCartBtn);
		
		
		
	}// 생성자끝

	public void displayProductDetails(Product recvProduct) throws Exception {
		
		productDetailImageLabel
		.setIcon(new ImageIcon(ProductDetailPanel.class.getResource("/productImage/size150/"+recvProduct.getPImage())));
		productDetailPriceLabel.setText(recvProduct.getPPrice()+"원");
		productDetailNameLabel.setText(recvProduct.getPName());
		
		productCartBtn.addMouseListener(new MouseAdapter() {
			/*************************************************/
			
			@Override
			public void mouseClicked(MouseEvent e) {
				
				CartService cartService=null;
				try {
					cartService = new CartService();
				} catch (Exception e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
			
				if (coffeeCrewMainFrame.loginMember != null) {
					// 로그인했을때
					/****************** 카트에담기 ***************/
					try {
						String cartQtyStr = (String) productDetailcomboBox.getSelectedItem();
						int cartQty = Integer.parseInt(cartQtyStr);
						Cart addCartItem = new Cart(0, coffeeCrewMainFrame.loginMember, recvProduct, cartQty);
						int addCount = cartService.addCart(coffeeCrewMainFrame.loginMember.getId(), recvProduct.getPNo(), cartQty);
						// 카트수량아이콘변경
						int cartItemCount = cartService.getCartItemByUserId(coffeeCrewMainFrame.loginMember.getId()).size();
						// 메세지출력
						JOptionPane.showMessageDialog(null, "장바구니에 제품이담겼습니다");
						coffeeCrewMainFrame.changePanel(coffeeCrewMainFrame.TOP_SHOP_ORDER_PANEL, coffeeCrewMainFrame.SUB_ORDER_CART_PANEL, recvProduct.getPNo());

					} catch (Exception ex) {
						ex.printStackTrace();
					}
					

				} 
				/*******************************************/
				
				
				
			}

			@Override
			public void mouseEntered(MouseEvent e) {
				productCartBtn.setCursor(new Cursor(Cursor.HAND_CURSOR));
			}

			@Override
			public void mouseExited(MouseEvent e) {
				productCartBtn.setCursor(new Cursor(Cursor.DEFAULT_CURSOR));
			}
		});
		
	}

	private void updatePrice() {
		Product product = new Product();
		int selectedQuantity = Integer.parseInt((String) productDetailcomboBox.getSelectedItem());
		int totalPrice = product.getPPrice() * selectedQuantity;
		productDetailPriceLabel.setText(totalPrice + " 원");
	}
	
	public void setCoffeeCrewMainFrame(CoffeeCrewMainFrame coffeeCrewMainFrame) {
		this.coffeeCrewMainFrame = coffeeCrewMainFrame;
	}
}
