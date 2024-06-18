package com.itwill.coffeecrew.shop.ui;

import javax.swing.JPanel;
import java.awt.Color;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;

import javax.swing.JButton;
import javax.swing.border.LineBorder;
import javax.swing.border.EmptyBorder;
import java.awt.BorderLayout;
import javax.swing.JLabel;
import javax.swing.ImageIcon;
import java.awt.Font;
import java.awt.SystemColor;

public class MainPanel extends JPanel {

	/**
	 * Create the panel.
	 */
	public MainPanel() {
		setBorder(new LineBorder(new Color(0, 0, 0), 22));
		setBackground(new Color(255, 255, 255));
		setLayout(null);
		
		JButton btnNewButton_1 = new JButton("New button");
		btnNewButton_1.setBounds(0, 0, 0, 0);
		btnNewButton_1.setBorder(new LineBorder(new Color(255, 0, 51)));
		add(btnNewButton_1);
		
		JButton btnNewButton_1_1 = new JButton("New button");
		btnNewButton_1_1.setBounds(0, 0, 0, 0);
		btnNewButton_1_1.setBorder(new LineBorder(new Color(255, 0, 51)));
		add(btnNewButton_1_1);
		
		JButton btnNewButton_1_2 = new JButton("New button");
		btnNewButton_1_2.setBounds(0, 0, 0, 0);
		btnNewButton_1_2.setBorder(new LineBorder(new Color(255, 0, 51)));
		add(btnNewButton_1_2);
		
		JPanel memberMainButtonBar = new JPanel();
		memberMainButtonBar.setBackground(new Color(253, 236, 166));
		memberMainButtonBar.setBounds(22, 395, 336, 33);
		add(memberMainButtonBar);
		
		JButton productListButton = new JButton("상품전체");
		productListButton.setFont(new Font("맑은 고딕", Font.PLAIN, 12));
		productListButton.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseClicked(MouseEvent e) {
				
				/******** 버튼 클릭 시 상품전체 화면으로 이동합니다 ********
				shopTabbedPane.setSelectedIndex(1);
				productTabbedPane.setSelectedIndex(0);
				/**************************************************************/
				
			}
		});
		memberMainButtonBar.add(productListButton);
		
		JButton orderHistoryButton = new JButton("주문내역");
		orderHistoryButton.setFont(new Font("맑은 고딕", Font.PLAIN, 12));
		orderHistoryButton.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseClicked(MouseEvent e) {
				
				/******** 버튼 클릭 시 주문내역 화면으로 이동합니다 ********
				shopTabbedPane.setSelectedIndex(2);
				orderTabbedPane.setSelectedIndex(0);
				/**************************************************************/
				
			}
		});
		memberMainButtonBar.add(orderHistoryButton);
		
		JButton cartListButton = new JButton("장바구니");
		cartListButton.setFont(new Font("맑은 고딕", Font.PLAIN, 12));
		cartListButton.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseClicked(MouseEvent e) {
				
				/******** 버튼 클릭 시 장바구니 화면으로 이동합니다 ********
				shopTabbedPane.setSelectedIndex(2);
				orderTabbedPane.setSelectedIndex(3);
				/**************************************************************/
				
			}
		});
		memberMainButtonBar.add(cartListButton);
		
		JLabel modelImage = new JLabel("");
		modelImage.setIcon(new ImageIcon(MainPanel.class.getResource("/image/main_model_270.png")));
		modelImage.setBounds(55, 49, 270, 321);
		add(modelImage);

	}
}
