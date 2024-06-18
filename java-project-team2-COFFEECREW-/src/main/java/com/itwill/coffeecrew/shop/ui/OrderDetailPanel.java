package com.itwill.coffeecrew.shop.ui;

import javax.swing.JPanel;
import java.awt.Color;
import javax.swing.JButton;
import javax.swing.border.LineBorder;

import com.itwill.coffeecrew.shop.order.Order;
import com.itwill.coffeecrew.shop.order.OrderItem;
import com.itwill.coffeecrew.shop.order.OrderService;

import javax.swing.border.EmptyBorder;
import javax.swing.JSplitPane;
import java.awt.GridLayout;
import java.awt.FlowLayout;
import java.awt.BorderLayout;
import java.awt.Dimension;
import javax.swing.JScrollPane;
import javax.swing.JLabel;
import javax.swing.SwingConstants;
import java.awt.event.ActionListener;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.awt.event.ActionEvent;
import java.awt.Font;
import javax.swing.JSeparator;
import javax.swing.BoxLayout;
import javax.swing.ImageIcon;

public class OrderDetailPanel extends JPanel {
	private JPanel orderItemListPanel;
	private JLabel orderPayMtdLabel;
	private JLabel orderTotalPriceLabel;
	private JPanel orderNoDatePanel;
	private JLabel orderDateLabel;
	private JLabel orderNoLabel;
	private JPanel orderPayMtdTotalPricePanel;
	private JPanel orderItemPanel;
	private JLabel orderItemNameLabel;
	private JLabel orderItemQtyLabel;
	private JLabel orderItemPriceLabel;
	CoffeeCrewMainFrame coffeeCrewMainFrame;
	Order order;
	/**
	 * Create the panel.
	 */
	
	public OrderDetailPanel() {
		setBackground(new Color(253, 236, 166));
		setLayout(new FlowLayout(FlowLayout.CENTER, 5, 5));
		
		orderNoDatePanel = new JPanel();
		orderNoDatePanel.setBackground(new Color(255, 255, 255));
		orderNoDatePanel.setPreferredSize(new Dimension(320, 80));
		add(orderNoDatePanel);
		orderNoDatePanel.setLayout(new GridLayout(0, 2, 0, 0));
		
		JLabel orderTopNoLabel = new JLabel("주문번호");
		orderTopNoLabel.setFont(new Font("맑은 고딕", Font.PLAIN, 14));
		orderTopNoLabel.setHorizontalAlignment(SwingConstants.CENTER);
		orderNoDatePanel.add(orderTopNoLabel);
		
		JLabel orderTopDateLabel = new JLabel("주문시간");
		orderTopDateLabel.setFont(new Font("맑은 고딕", Font.PLAIN, 14));
		orderTopDateLabel.setHorizontalAlignment(SwingConstants.CENTER);
		orderNoDatePanel.add(orderTopDateLabel);
		
		JScrollPane orderItemListScrollPane = new JScrollPane();
		orderItemListScrollPane.setPreferredSize(new Dimension(320, 240));
		add(orderItemListScrollPane);
		
		orderItemListPanel = new JPanel();
		orderItemListPanel.setBackground(new Color(255, 255, 255));
		orderItemListPanel.setPreferredSize(new Dimension(300, 10));
		orderItemListScrollPane.setViewportView(orderItemListPanel);
		
		orderPayMtdTotalPricePanel = new JPanel();
		orderPayMtdTotalPricePanel.setBackground(new Color(255, 255, 255));
		orderPayMtdTotalPricePanel.setPreferredSize(new Dimension(320, 80));
		add(orderPayMtdTotalPricePanel);
		orderPayMtdTotalPricePanel.setLayout(new GridLayout(0, 2, 0, 0));
		
		JLabel orderTopPayMtdLabel = new JLabel("결제수단");
		orderTopPayMtdLabel.setFont(new Font("맑은 고딕", Font.PLAIN, 14));
		orderTopPayMtdLabel.setHorizontalAlignment(SwingConstants.CENTER);
		orderPayMtdTotalPricePanel.add(orderTopPayMtdLabel);
		
		JLabel orderTopTotalPriceLabel = new JLabel("결제금액");
		orderTopTotalPriceLabel.setFont(new Font("맑은 고딕", Font.PLAIN, 14));
		orderTopTotalPriceLabel.setHorizontalAlignment(SwingConstants.CENTER);
		orderPayMtdTotalPricePanel.add(orderTopTotalPriceLabel);
		
	}
	
	public void displayOrderItemList(Order recvOrder) {
		
		this.order = recvOrder;
		orderNoDatePanel.removeAll();
		orderPayMtdTotalPricePanel.removeAll();
		
		orderNoLabel = new JLabel("<html>주문번호<br>&nbsp; &nbsp; " + order.getONo());
		orderNoLabel.setFont(new Font("맑은 고딕", Font.PLAIN, 14));
		orderNoLabel.setHorizontalAlignment(SwingConstants.CENTER);
		orderNoDatePanel.add(orderNoLabel);
		
		orderDateLabel = new JLabel("<html>&nbsp; &nbsp; &nbsp; 주문시간<br> " + new SimpleDateFormat("yyyy-MM-dd HH:mm").format(order.getODate()));
		orderDateLabel.setFont(new Font("맑은 고딕", Font.PLAIN, 14));
		orderDateLabel.setHorizontalAlignment(SwingConstants.CENTER);
		orderNoDatePanel.add(orderDateLabel);
		
		orderPayMtdLabel = new JLabel("<html>결제수단<br>" + order.getOPayMtd());
		orderPayMtdLabel.setFont(new Font("맑은 고딕", Font.PLAIN, 14));
		orderPayMtdLabel.setHorizontalAlignment(SwingConstants.CENTER);
		orderPayMtdTotalPricePanel.add(orderPayMtdLabel);
		
		orderTotalPriceLabel = new JLabel("<html>결제금액<br>" + new DecimalFormat("#,###").format(order.getOTotalPrice()) + "원");
		orderTotalPriceLabel.setFont(new Font("맑은 고딕", Font.PLAIN, 14));
		orderTotalPriceLabel.setHorizontalAlignment(SwingConstants.CENTER);
		orderPayMtdTotalPricePanel.add(orderTotalPriceLabel);
		
		List<OrderItem> orderItemList = order.getOrderItemList();
		
		int orderTotalPrice = 0;
		orderItemListPanel.removeAll();
		
		orderItemPanel = new JPanel();
		orderItemPanel.setBackground(new Color(255, 255, 255));
		orderItemPanel.setPreferredSize(new Dimension(300, 30));
		orderItemListPanel.add(orderItemPanel);
		orderItemPanel.setLayout(new GridLayout(1, 0, 0, 0));
		
		orderItemNameLabel = new JLabel("메뉴");
		orderItemNameLabel.setFont(new Font("맑은 고딕", Font.PLAIN, 13));
		orderItemNameLabel.setHorizontalAlignment(SwingConstants.CENTER);
		orderItemPanel.add(orderItemNameLabel);
		
		orderItemQtyLabel = new JLabel("수량");
		orderItemQtyLabel.setFont(new Font("맑은 고딕", Font.PLAIN, 13));
		orderItemQtyLabel.setHorizontalAlignment(SwingConstants.CENTER);
		orderItemPanel.add(orderItemQtyLabel);
		
		orderItemPriceLabel = new JLabel("가격");
		orderItemPriceLabel.setFont(new Font("맑은 고딕", Font.PLAIN, 13));
		orderItemPriceLabel.setHorizontalAlignment(SwingConstants.CENTER);
		orderItemPanel.add(orderItemPriceLabel);
		
		JPanel orderSeparatePanel = new JPanel();
		orderSeparatePanel.setBackground(new Color(0, 0, 0));
		orderSeparatePanel.setPreferredSize(new Dimension(300, 2));
		orderItemListPanel.add(orderSeparatePanel);
		
		for (OrderItem orderItem : orderItemList) {
			orderItemPanel = new JPanel();
			orderItemPanel.setBackground(new Color(255, 255, 255));
			orderItemPanel.setPreferredSize(new Dimension(300, 30));
			orderItemListPanel.add(orderItemPanel);
			orderItemPanel.setLayout(new GridLayout(1, 0, 0, 0));
			
			orderItemNameLabel = new JLabel(orderItem.getProduct().getPName());
			orderItemNameLabel.setFont(new Font("맑은 고딕", Font.PLAIN, 13));
			orderItemNameLabel.setHorizontalAlignment(SwingConstants.CENTER);
			orderItemPanel.add(orderItemNameLabel);
			
			orderItemQtyLabel = new JLabel(Integer.toString(orderItem.getOiQty()));
			orderItemQtyLabel.setFont(new Font("맑은 고딕", Font.PLAIN, 13));
			orderItemQtyLabel.setHorizontalAlignment(SwingConstants.CENTER);
			orderItemPanel.add(orderItemQtyLabel);

			orderTotalPrice += orderItem.getProduct().getPPrice() * orderItem.getOiQty();
			
			orderItemPriceLabel = new JLabel(new DecimalFormat("#,###").format(orderItem.getProduct().getPPrice() * orderItem.getOiQty()) + "원");
			orderItemPriceLabel.setFont(new Font("맑은 고딕", Font.PLAIN, 13));
			orderItemPriceLabel.setHorizontalAlignment(SwingConstants.CENTER);
			orderItemPanel.add(orderItemPriceLabel);
			
		}
		
		order.setOTotalPrice(orderTotalPrice);
	}
	
	public void setCoffeeCrewMain(CoffeeCrewMainFrame coffeeCrewMainFrame) {
		this.coffeeCrewMainFrame = coffeeCrewMainFrame;
	}
}
