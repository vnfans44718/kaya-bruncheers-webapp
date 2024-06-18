package com.itwill.coffeecrew.shop.ui;

import javax.swing.JPanel;
import java.awt.Color;
import javax.swing.JButton;
import javax.swing.border.LineBorder;
import javax.swing.border.EmptyBorder;
import javax.swing.JScrollPane;
import javax.swing.JScrollBar;
import javax.swing.JTable;
import javax.swing.table.DefaultTableModel;

import com.itwill.coffeecrew.shop.member.Member;
import com.itwill.coffeecrew.shop.member.MemberService;
import com.itwill.coffeecrew.shop.order.Order;
import com.itwill.coffeecrew.shop.order.OrderService;
import com.itwill.coffeecrew.shop.product.ProductService;

import javax.swing.JList;
import java.awt.BorderLayout;
import java.awt.Dimension;
import javax.swing.JLabel;
import javax.swing.AbstractButton;
import javax.swing.ImageIcon;
import java.awt.Font;
import java.awt.SystemColor;
import java.awt.event.ActionListener;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.List;
import java.awt.event.ActionEvent;
import javax.swing.ScrollPaneConstants;

public class OrderListPanel extends JPanel {
	private JPanel orderListPanel;
	private JButton orderDetailButton;
	private JPanel orderListContentPanel;
	CoffeeCrewMainFrame coffeeCrewMainFrame;

	/**
	 * Create the panel.
	 */
	public OrderListPanel() {
		setBackground(new Color(255, 255, 255));
		setLayout(new BorderLayout(0, 0));

		JScrollPane orderListScrollPane = new JScrollPane();
		add(orderListScrollPane);

		orderListPanel = new JPanel();
		orderListPanel.setBackground(new Color(253, 236, 166));
		orderListPanel.setPreferredSize(new Dimension(310, 3000));
		orderListScrollPane.setViewportView(orderListPanel);

		orderListContentPanel = new JPanel();
		orderListContentPanel.setBackground(new Color(255, 255, 255));
		orderListContentPanel.setPreferredSize(new Dimension(300, 100));
		orderListContentPanel.setLayout(null);
		if (coffeeCrewMainFrame != null && coffeeCrewMainFrame.loginMember != null) {
			try {
				displayOrderList(coffeeCrewMainFrame.loginMember);
			} catch (Exception e1) {
				e1.printStackTrace();
			}
		}

	}

	public void displayOrderList(Member member) {
		MemberService memberService=null;
		Member loginMember=null;
		OrderService orderService=null;
		List<Order> orderList=null;
		try {
			memberService = new MemberService();
			loginMember = member;
			orderService = new OrderService();
			orderList = orderService.orderWithOrderItemList(loginMember.getId());
		} catch (Exception e) {
			e.printStackTrace();
		}
		//Member loginMember = Member.builder().id("kim1").build();
		Collections.sort(orderList, new Comparator<Order>() {

			@Override
			public int compare(Order o1, Order o2) {
				int i = o1.getODate().compareTo(o2.getODate());
				return i;
			}
		});
		Collections.reverse(orderList);

		for (Order order : orderList) {
			orderListContentPanel = new JPanel();
			orderListContentPanel.setBackground(new Color(255, 255, 255));
			orderListContentPanel.setPreferredSize(new Dimension(300, 100));
			orderListPanel.add(orderListContentPanel);
			orderListContentPanel.setLayout(null);

			JLabel orderCircleIconLabel = new JLabel("");
			orderCircleIconLabel.setIcon(
					new ImageIcon(OrderListPanel.class.getResource("/image/logo-circle-no-background-75x75.png")));
			orderCircleIconLabel.setBounds(0, 10, 75, 80);
			orderListContentPanel.add(orderCircleIconLabel);

			JLabel orderDateLabel = new JLabel(new SimpleDateFormat("yyyy-MM-dd HH:mm").format(order.getODate()));
			orderDateLabel.setFont(new Font("맑은 고딕", Font.PLAIN, 14));
			orderDateLabel.setBounds(87, 10, 124, 23);
			orderListContentPanel.add(orderDateLabel);

			JLabel orderNameLabel = new JLabel(order.getOName());
			orderNameLabel.setFont(new Font("맑은 고딕", Font.PLAIN, 14));
			orderNameLabel.setBounds(87, 38, 138, 23);
			orderListContentPanel.add(orderNameLabel);

			JLabel orderTotalPriceLabel = new JLabel(new DecimalFormat("#,###").format(order.getOTotalPrice()) + "원");
			orderTotalPriceLabel.setFont(new Font("맑은 고딕", Font.PLAIN, 14));
			orderTotalPriceLabel.setBounds(87, 67, 111, 23);
			orderListContentPanel.add(orderTotalPriceLabel);

			orderDetailButton = new JButton("<html>\r\n주문<br>\r\n상세\r\n");
			orderDetailButton.addActionListener(new ActionListener() {
				public void actionPerformed(ActionEvent e) {
					coffeeCrewMainFrame.changePanel(CoffeeCrewMainFrame.TOP_SHOP_ORDER_PANEL,
							CoffeeCrewMainFrame.SUB_ORDER_DETAIL_PANEL, order);
				}
			});
			orderDetailButton.setFont(new Font("맑은 고딕", Font.PLAIN, 13));
			orderDetailButton.setBounds(238, 22, 60, 60);
			orderListContentPanel.add(orderDetailButton);

		}
	}

	public void setCoffeeCrewMainFrame(CoffeeCrewMainFrame coffeeCrewMainFrame) {
		this.coffeeCrewMainFrame = coffeeCrewMainFrame;
	}

}
