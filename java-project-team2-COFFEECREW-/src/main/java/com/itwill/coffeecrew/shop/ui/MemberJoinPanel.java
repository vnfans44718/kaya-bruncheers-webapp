package com.itwill.coffeecrew.shop.ui;

import javax.swing.JPanel;
import javax.swing.JPasswordField;

import java.awt.Color;
import javax.swing.JButton;
import javax.swing.border.LineBorder;

import com.itwill.coffeecrew.shop.member.Member;
import com.itwill.coffeecrew.shop.member.MemberService;

import javax.swing.border.EmptyBorder;
import javax.swing.JTextField;
import javax.swing.JLabel;
import javax.swing.JOptionPane;

import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;
import java.awt.Font;
import java.awt.SystemColor;
import javax.swing.SwingConstants;

public class MemberJoinPanel extends JPanel {
	

	
	
	
	private JTextField joinIdTF;
	private JPasswordField joinPwTF;
	private JPasswordField joinPwCheckTF;
	private JTextField joinPhoneTF;
	private JTextField joinBirthDateTF;
	private JTextField joinEmailTF;
	private JTextField joinNicknameTF;
	private JLabel joinPwMsgLB;
	private JLabel memberNicknameLabel;
	private JLabel memberBirthdateLabel;
	private JLabel memberPhoneLabel;
	private JLabel memberIdLabel;
	private JLabel memberPwLabel;
	private JLabel memberEmailLabel;

	/**
	 * Create the panel.
	 */
	public MemberJoinPanel() {
		setBackground(new Color(255, 255, 255));
		setLayout(null);
		
		joinIdTF = new JTextField();
		joinIdTF.setBounds(153, 63, 80, 21);
		add(joinIdTF);
		joinIdTF.setColumns(10);
		
		joinPwTF = new JPasswordField();
		joinPwTF.setBounds(153, 94, 149, 21);
		add(joinPwTF);
		joinPwTF.setColumns(10);
		
		joinPwCheckTF = new JPasswordField();
		joinPwCheckTF.setBounds(153, 125, 150, 21);
		add(joinPwCheckTF);
		joinPwCheckTF.setColumns(10);
		
		joinPhoneTF = new JTextField();
		joinPhoneTF.setBounds(153, 189, 149, 21);
		add(joinPhoneTF);
		joinPhoneTF.setColumns(10);
		
		joinBirthDateTF = new JTextField();
		joinBirthDateTF.setBounds(153, 220, 149, 21);
		add(joinBirthDateTF);
		joinBirthDateTF.setColumns(10);
		
		joinEmailTF = new JTextField();
		joinEmailTF.setBounds(153, 265, 80, 21);
		add(joinEmailTF);
		joinEmailTF.setColumns(10);
		
		joinNicknameTF = new JTextField();
		joinNicknameTF.setBounds(153, 303, 149, 21);
		add(joinNicknameTF);
		joinNicknameTF.setColumns(10);
		
		JButton joinJoinButton = new JButton("회원가입");
		joinJoinButton.setFont(new Font("맑은 고딕", Font.PLAIN, 12));
		joinJoinButton.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				
				// 회원가입
				// textfield에서 데이터 얻기 
				try {
					MemberService memberService = new MemberService();
					
					String id = joinIdTF.getText();
					String password = joinPwTF.getText();
					String passwordCheck = joinPwCheckTF.getText();
					String phone = joinPhoneTF.getText();
					String birthDate = joinBirthDateTF.getText();
					String email = joinEmailTF.getText();
					String nickname = joinNicknameTF.getText();
				
					//정보를 입력했는지
					if(id.equals("") || password.equals("") || passwordCheck.equals("") || phone.equals("") || birthDate.equals("") || email.equals("") || nickname.equals("")) {
						JOptionPane.showMessageDialog(null, "내용을 입력하세요");
						return;
					}
			
					//비밀번호를 동일하게 입력했는지
					if(joinPwTF.getText().equals((joinPwCheckTF).getText())) {
						joinPwMsgLB.setText("");
					}else {
						joinPwMsgLB.setText("비밀번호가 일치하지 않습니다");
						joinPwTF.setText("");
						joinPwTF.requestFocus();
						joinPwCheckTF.setText("");
						return;
					}
				
					//회원정보 넣기 
					Member newMember = new Member(id, password, passwordCheck, phone, birthDate, email, nickname);
				
					int addCount = memberService.addMember(newMember);
				
					if(addCount > 0) { 
						JOptionPane.showMessageDialog(null, "회원가입에 성공하셨습니다");
						joinIdTF.setText("");
						joinPwTF.setText("");
						joinPwCheckTF.setText("");
						joinPhoneTF.setText("");
						joinBirthDateTF.setText("");
						joinEmailTF.setText("");
						joinNicknameTF.setText("");
					
					/************* 로그인 화면으로 이동합니다 ****************
					memberTabbedPane.setSelectedIndex(0);
					/******************************************************************/
					
					}else {
						JOptionPane.showMessageDialog(null, "회원가입에 실패하셨습니다");
					}
				
				}catch (Exception e1) {
					
				}
			}
		});
	
		joinJoinButton.setBounds(74, 356, 228, 33);
		add(joinJoinButton);
		
		JButton joinIdCheckButton = new JButton("확인");
		joinIdCheckButton.setFont(new Font("맑은 고딕", Font.PLAIN, 10));
		joinIdCheckButton.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				
				//아이디 중복체크
				try {
					MemberService memberService = new MemberService();
					String id = joinIdTF.getText();
					boolean isSuccess = memberService.idCheck(id);
					
					if(id.equals("")) {
						JOptionPane.showMessageDialog(null, "내용을 입력하세요");
						return;
					}
					
					if(isSuccess == true) {
						JOptionPane.showMessageDialog(null, "사용 가능한 아이디입니다");
						joinPwTF.requestFocus();
					}else {
						JOptionPane.showMessageDialog(null, "존재하는 아이디입니다");
						joinIdTF.setText("");
						joinIdTF.requestFocus();
					}
				} catch (Exception e1) {
					e1.printStackTrace();
				}
				
				
			}
		});
		
		joinIdCheckButton.setBounds(245, 62, 57, 23);
		add(joinIdCheckButton);
		
		JButton joinEmailCheckButton = new JButton("확인");
		joinEmailCheckButton.setFont(new Font("맑은 고딕", Font.PLAIN, 10));
		joinEmailCheckButton.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				
				//이메일 중복체크
				try {
					MemberService memberService = new MemberService();
					String email = joinEmailTF.getText();
					boolean isSuccess = memberService.emailCheck(email);
					
					if(email.equals("")){
						JOptionPane.showMessageDialog(null, "내용을 입력하세요");
						return;
					}
					
					if(isSuccess == true) {
						JOptionPane.showMessageDialog(null, "사용 가능한 이메일입니다");
						joinNicknameTF.requestFocus();
					}else {
						JOptionPane.showMessageDialog(null, "이미 가입되어 있는 이메일입니다");
						joinEmailTF.setText("");
						joinEmailTF.requestFocus();
						
						
					}
					
				} catch (Exception e1) {
					e1.printStackTrace();
				}
				
			}
		});
		
		joinEmailCheckButton.setBounds(245, 264, 57, 23);
		add(joinEmailCheckButton);
		
		joinPwMsgLB = new JLabel("");
		joinPwMsgLB.setForeground(SystemColor.textHighlight);
		joinPwMsgLB.setFont(new Font("맑은 고딕", Font.PLAIN, 10));
		joinPwMsgLB.setBounds(162, 152, 149, 15);
		add(joinPwMsgLB);
		
		memberNicknameLabel = new JLabel("닉네임");
		memberNicknameLabel.setHorizontalAlignment(SwingConstants.LEFT);
		memberNicknameLabel.setFont(new Font("맑은 고딕", Font.PLAIN, 10));
		memberNicknameLabel.setBounds(74, 306, 57, 15);
		add(memberNicknameLabel);
		
		memberBirthdateLabel = new JLabel("생년월일");
		memberBirthdateLabel.setHorizontalAlignment(SwingConstants.LEFT);
		memberBirthdateLabel.setFont(new Font("맑은 고딕", Font.PLAIN, 10));
		memberBirthdateLabel.setBounds(74, 230, 57, 15);
		add(memberBirthdateLabel);
		
		memberPhoneLabel = new JLabel("핸드폰 번호");
		memberPhoneLabel.setHorizontalAlignment(SwingConstants.LEFT);
		memberPhoneLabel.setFont(new Font("맑은 고딕", Font.PLAIN, 10));
		memberPhoneLabel.setBounds(74, 192, 57, 15);
		add(memberPhoneLabel);
		
		memberIdLabel = new JLabel("아이디");
		memberIdLabel.setHorizontalAlignment(SwingConstants.LEFT);
		memberIdLabel.setFont(new Font("맑은 고딕", Font.PLAIN, 10));
		memberIdLabel.setBounds(74, 66, 57, 15);
		add(memberIdLabel);
		
		memberPwLabel = new JLabel("비밀번호");
		memberPwLabel.setHorizontalAlignment(SwingConstants.LEFT);
		memberPwLabel.setFont(new Font("맑은 고딕", Font.PLAIN, 10));
		memberPwLabel.setBounds(74, 105, 57, 15);
		add(memberPwLabel);
		
		memberEmailLabel = new JLabel("이메일");
		memberEmailLabel.setHorizontalAlignment(SwingConstants.LEFT);
		memberEmailLabel.setFont(new Font("맑은 고딕", Font.PLAIN, 10));
		memberEmailLabel.setBounds(74, 268, 57, 15);
		add(memberEmailLabel);
		
		JLabel memberCheckPwLabel = new JLabel("비밀번호 확인");
		memberCheckPwLabel.setFont(new Font("맑은 고딕", Font.PLAIN, 10));
		memberCheckPwLabel.setBounds(74, 128, 73, 15);
		add(memberCheckPwLabel);
		
	
		
		

		
		
		

	}//생성자끝
}//클래스끝











