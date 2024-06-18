package com.itwill.coffeecrew.shop.ui;

import javax.swing.JPanel;
import java.awt.Color;
import javax.swing.JButton;
import javax.swing.JOptionPane;
import javax.swing.border.LineBorder;

import com.itwill.coffeecrew.shop.member.Member;
import com.itwill.coffeecrew.shop.member.MemberService;

import javax.swing.border.EmptyBorder;
import javax.swing.JTextField;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;
import javax.swing.JLabel;
import java.awt.Font;

public class MemberFindPanel extends JPanel {
	CoffeeCrewMainFrame coffeeCrewMainFrame;

	// MemberService 멤버필드 선언
	// MemberService memberService;
	
	// Member 멤버필드 선언
	// Member findMember;
	
	
	private JTextField findPhoneTF;
	private JTextField findEmailTF;
	private JTextField findIdTF;
	private JTextField findEmailTF2;

	/**
	 * Create the panel.
	 */
	public MemberFindPanel() {
		setBackground(new Color(255, 255, 255));
		setLayout(null);
		
		findPhoneTF = new JTextField();
		findPhoneTF.setBounds(158, 85, 143, 21);
		add(findPhoneTF);
		findPhoneTF.setColumns(10);
		
		findEmailTF = new JTextField();
		findEmailTF.setBounds(158, 116, 143, 21);
		add(findEmailTF);
		findEmailTF.setColumns(10);
		
		JButton findIdButton = new JButton("아이디 찾기");
		findIdButton.setFont(new Font("맑은 고딕", Font.PLAIN, 12));
		findIdButton.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				//아이디 찾기 메소드 호출
				try {
					MemberService memberService = new MemberService();
					String phone = findPhoneTF.getText();
					String email = findEmailTF.getText();
					Member findMember = memberService.findId(phone, email);
					
					//정보를 입력했는지
					if(phone.equals("") || email.equals("")) {
						JOptionPane.showMessageDialog(null, "내용을 입력하세요");
						findPhoneTF.requestFocus();
						findPhoneTF.select(0, phone.length());
						return;
					}
					
					if(findMember != null) {
						JOptionPane.showMessageDialog(null, "회원님의 아이디는 "+findMember.getId()+"입니다");
						findPhoneTF.setText("");
						findEmailTF.setText("");
						
					}else {
						JOptionPane.showMessageDialog(null, "핸드폰 번호나 이메일을 잘못 입력하셨습니다");
						findPhoneTF.setText("");
						findPhoneTF.requestFocus();
						findEmailTF.setText("");
						
						
					}
					
				} catch (Exception e1) {
					e1.printStackTrace();
				}
				
				
			}
		});
		findIdButton.setBounds(76, 147, 228, 33);
		add(findIdButton);
		
		findIdTF = new JTextField();
		findIdTF.setBounds(158, 213, 143, 21);
		add(findIdTF);
		findIdTF.setColumns(10);
		
		findEmailTF2 = new JTextField();
		findEmailTF2.setBounds(158, 244, 143, 21);
		add(findEmailTF2);
		findEmailTF2.setColumns(10);
		
		JButton findPwButton = new JButton("비밀번호 찾기");
		findPwButton.setFont(new Font("맑은 고딕", Font.PLAIN, 12));
		findPwButton.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				//비밀번호 찾기 메소드 호출
				
				try {
					MemberService memberService = new MemberService();
					String id = findIdTF.getText();
					String email = findEmailTF2.getText();
					Member findMember = memberService.findPw(id, email);

					//정보를 입력했는지
					if(id.equals("") || email.equals("")) {
						JOptionPane.showMessageDialog(null, "내용을 입력하세요");
						findIdTF.requestFocus();
						findIdTF.select(0, id.length());
						return;
					}
					
					if(findMember != null) {
						JOptionPane.showMessageDialog(null, "회원님의 비밀번호는 "+findMember.getPw()+"입니다");
						findIdTF.setText("");
						findEmailTF2.setText("");
					}else {
						JOptionPane.showMessageDialog(null, "아이디나 이메일을 잘못 입력하셨습니다");
						findIdTF.setText("");
						findIdTF.requestFocus();
						findEmailTF2.setText("");
						
						
						
					}
				} catch (Exception e1) {
					e1.printStackTrace();
				}
				
			}
		});
		findPwButton.setBounds(76, 276, 228, 33);
		add(findPwButton);
		
		JButton findLoginButton = new JButton("로그인");
		findLoginButton.setFont(new Font("맑은 고딕", Font.PLAIN, 12));
		findLoginButton.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseClicked(MouseEvent e) {
				
				/******** 버튼 클릭 시 로그인 화면으로 이동합니다 ********/
				//coffeeCrewMainFrame.changePanel(1, 0, null);
				
			}
		});
		findLoginButton.setBounds(76, 343, 228, 33);
		add(findLoginButton);
		
		JLabel memberPoneLabel = new JLabel("핸드폰 번호");
		memberPoneLabel.setFont(new Font("맑은 고딕", Font.PLAIN, 12));
		memberPoneLabel.setBounds(73, 85, 73, 15);
		add(memberPoneLabel);
		
		JLabel memberEmailLabel = new JLabel("이메일");
		memberEmailLabel.setFont(new Font("맑은 고딕", Font.PLAIN, 12));
		memberEmailLabel.setBounds(73, 116, 57, 15);
		add(memberEmailLabel);
		
		JLabel memberIdLabel = new JLabel("아이디");
		memberIdLabel.setFont(new Font("맑은 고딕", Font.PLAIN, 12));
		memberIdLabel.setBounds(73, 213, 57, 15);
		add(memberIdLabel);
		
		JLabel memberEmailLabel2 = new JLabel("이메일");
		memberEmailLabel2.setFont(new Font("맑은 고딕", Font.PLAIN, 12));
		memberEmailLabel2.setBounds(73, 244, 57, 15);
		add(memberEmailLabel2);

		
		// MemberService 멤버필드 객체 생성
		// memberService = new MemberService();
		
		// Member 멤버필드 객체 생성
		// findMember = new Member();
		
		
		
	}//생성자끝
}//클래스끝
