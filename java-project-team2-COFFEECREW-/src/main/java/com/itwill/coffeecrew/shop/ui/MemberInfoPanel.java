package com.itwill.coffeecrew.shop.ui;

import javax.swing.JPanel;
import javax.swing.JPasswordField;

import java.awt.Color;
import javax.swing.JButton;
import javax.swing.JOptionPane;
import javax.swing.border.LineBorder;

import com.itwill.coffeecrew.shop.member.Member;
import com.itwill.coffeecrew.shop.member.MemberService;

import javax.swing.border.EmptyBorder;
import javax.swing.JTextField;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;
import java.awt.Font;
import javax.swing.JLabel;

public class MemberInfoPanel extends JPanel {
	

	CoffeeCrewMainFrame coffeeCrewMainFrame;
	
	
	private JTextField infoIdTF;
	private JPasswordField infoPwTF;
	private JPasswordField infoPwUpdateTF;
	private JTextField infoPhoneTF;
	private JTextField infoBirthDateTF;
	private JTextField infoEmailTF;
	private JTextField infoNicknameTF;
	private JButton infoUpdateButton;
	private JButton infoUpdateFormButton;
	private JButton infoPwUpdateButton;
	private JLabel memberNicknameLabel;
	private JLabel memberEmailLabel;
	private JLabel memberIdLabel;
	private JLabel memberPwLabel;
	private JLabel memberNewPwLabel;
	private JLabel memberPhoneLabel;
	private JLabel memberBirthdateLabel;

	public void setCoffeeCrewMainFrame(CoffeeCrewMainFrame coffeeCrewMainFrame) {
		this.coffeeCrewMainFrame = coffeeCrewMainFrame;
	}
	
	public MemberInfoPanel() {
		setBackground(new Color(255, 255, 255));
		setLayout(null);
		
		infoIdTF = new JTextField();
		infoIdTF.setBounds(148, 63, 156, 21);
		add(infoIdTF);
		infoIdTF.setColumns(10);
		
		infoPwTF = new JPasswordField();
		infoPwTF.setBounds(148, 94, 156, 21);
		add(infoPwTF);
		infoPwTF.setColumns(10);
		
		infoPwUpdateTF = new JPasswordField();
		infoPwUpdateTF.setBounds(148, 117, 87, 21);
		add(infoPwUpdateTF);
		infoPwUpdateTF.setColumns(10);
		
		infoPhoneTF = new JTextField();
		infoPhoneTF.setBounds(148, 148, 156, 21);
		add(infoPhoneTF);
		infoPhoneTF.setColumns(10);
		
		infoBirthDateTF = new JTextField();
		infoBirthDateTF.setBounds(148, 179, 156, 21);
		add(infoBirthDateTF);
		infoBirthDateTF.setColumns(10);
		
		infoEmailTF = new JTextField();
		infoEmailTF.setBounds(148, 212, 156, 21);
		add(infoEmailTF);
		infoEmailTF.setColumns(10);
		
		infoNicknameTF = new JTextField();
		infoNicknameTF.setBounds(148, 247, 156, 21);
		add(infoNicknameTF);
		infoNicknameTF.setColumns(10);
		
		JButton infoDeleteButton = new JButton("회원탈퇴");
		infoDeleteButton.setFont(new Font("맑은 고딕", Font.PLAIN, 12));
		infoDeleteButton.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				
				try {
					MemberService memberService = new MemberService();
			
					String id = infoIdTF.getText();
					
					int var = JOptionPane.showConfirmDialog
							(null, "정말 탈퇴하시겠습니까?", "탈퇴", JOptionPane.YES_NO_OPTION, JOptionPane.WARNING_MESSAGE);
					
					if(var == 0) {
						memberService.memberDelete(id);
						JOptionPane.showConfirmDialog(null, "탈퇴되었습니다");
						infoIdTF.setText("");
						infoPwTF.setText("");
						infoPwUpdateTF.setText("");
						infoPhoneTF.setText("");
						infoBirthDateTF.setText("");
						infoEmailTF.setText("");
						infoNicknameTF.setText("");
						
						/******************** 로그인 화면으로 이동 ***********
						memberTabbedPane.setSelectedIndex(1);
						/*****************************************************/
						
					}else {
						JOptionPane.getRootFrame().dispose();
					}
					
				} catch (Exception e1) {
					e1.printStackTrace();
				}
				
				
			}
		});
		infoDeleteButton.setBounds(76, 359, 228, 33);
		add(infoDeleteButton);
		
		infoUpdateButton = new JButton("수정");
		infoUpdateButton.setFont(new Font("맑은 고딕", Font.PLAIN, 12));
		infoUpdateButton.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				
				//회원정보 수정
				//아이디와 생년월일은 수정불가
				
				try {
					String id = infoIdTF.getText();
					String password = infoPwTF.getText();
					String passwordUpdate = infoPwUpdateTF.getText();
					String phone = infoPhoneTF.getText();
					String birthdate = infoBirthDateTF.getText();
					String email = infoEmailTF.getText();
					String nickname = infoNicknameTF.getText();
					
					//Member loginMember = new Member(id, passwordUpdate, birthdate, phone, email, nickname);
					
					Member loginMember = Member.builder()
											   .id(id)
							                   .pw(password)
							                   .pwcheck(passwordUpdate)
							                   .phone(phone)
							                   .birthdate(birthdate)
							                   .email(email)
							                   .nickname(nickname)
							                   .build();
					MemberService memberService=new MemberService();
					int updateCount = memberService.memberUpdate(loginMember);
					
					if(id.equals("") || password.equals("") || passwordUpdate.equals("") || phone.equals("") || birthdate.equals("") || email.equals("") || nickname.equals("")) {
						JOptionPane.showMessageDialog(null, "내용을 입력하세요");
						return;
					}
					if(updateCount > 0) {
						JOptionPane.showMessageDialog(null, "회원정보가 수정되었습니다");
					}else {
						JOptionPane.showMessageDialog(null, "회원정보 변경에 실패했습니다");
					}
				} catch (Exception e1) {
					e1.printStackTrace();
				}
				
				
			}
		});
		infoUpdateButton.setBounds(76, 321, 228, 33);
		add(infoUpdateButton);
		
		infoUpdateFormButton = new JButton("내 정보 보기");
		infoUpdateFormButton.setFont(new Font("맑은 고딕", Font.PLAIN, 12));
		infoUpdateFormButton.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				
				/*
				Member loginMember = Member.builder()
						.id("park3")
						.pw("3333")
						.pwcheck("3333")
						.phone("010-3333-3333")
						.birthdate("19950303")
						.email("parkcoffee@naver.com")
						.nickname("박커피")
						.build();
				//내 회원정보보기
				displayMemberInfo(loginMember);
				*/
				
				try {
					MemberService memberService = new MemberService();
					Member loginMember = memberService.memberDetail(coffeeCrewMainFrame.loginMember.getId());
					
					infoIdTF.setText(loginMember.getId());
					infoPwTF.setText(loginMember.getPw());
					infoPwUpdateTF.setText(loginMember.getPwcheck());
					infoPhoneTF.setText(loginMember.getPhone());
					infoBirthDateTF.setText(loginMember.getBirthdate());
					infoEmailTF.setText(loginMember.getEmail());
					infoNicknameTF.setText(loginMember.getNickname());
				} catch (Exception e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
				
				
				//수정폼 활성화 (아이디, 생년월일 제외)
				updateFormEnable(true);
				
			
				
			}

			
		});
		infoUpdateFormButton.setBounds(76, 282, 228, 33);
		add(infoUpdateFormButton);
		
		infoPwUpdateButton = new JButton("확인");
		infoPwUpdateButton.setFont(new Font("맑은 고딕", Font.PLAIN, 10));
		infoPwUpdateButton.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				
				//비밀번호 변경 메소드 호출
				
				MemberService memberService=null;
				try {
					memberService = new MemberService();
				
					String id = infoIdTF.getText();
					String passwordUpdate = infoPwUpdateTF.getText();
					boolean isSuccess = memberService.updatePassword(passwordUpdate, id);
					
					if(passwordUpdate.equals("")) {
						JOptionPane.showMessageDialog(null, "내용을 입력하세요");
						return;
					}
					
					if(isSuccess) {
						JOptionPane.showMessageDialog(null, "비밀번호가 변경되었습니다");
					}else {
						JOptionPane.showMessageDialog(null, "비밀번호를 다시 입력하세요");
					}
				} catch (Exception e1) {
					
					e1.printStackTrace();
				}
				
				
				
			}
		});
		infoPwUpdateButton.setBounds(247, 116, 57, 23);
		add(infoPwUpdateButton);
		
		memberNicknameLabel = new JLabel("닉네임");
		memberNicknameLabel.setFont(new Font("맑은 고딕", Font.PLAIN, 10));
		memberNicknameLabel.setBounds(76, 250, 57, 15);
		add(memberNicknameLabel);
		
		memberEmailLabel = new JLabel("이메일");
		memberEmailLabel.setFont(new Font("맑은 고딕", Font.PLAIN, 10));
		memberEmailLabel.setBounds(76, 215, 57, 15);
		add(memberEmailLabel);
		
		memberIdLabel = new JLabel("아이디");
		memberIdLabel.setFont(new Font("맑은 고딕", Font.PLAIN, 10));
		memberIdLabel.setBounds(76, 66, 57, 15);
		add(memberIdLabel);
		
		memberPwLabel = new JLabel("비밀번호");
		memberPwLabel.setFont(new Font("맑은 고딕", Font.PLAIN, 10));
		memberPwLabel.setBounds(75, 97, 57, 15);
		add(memberPwLabel);
		
		memberNewPwLabel = new JLabel("새 비밀번호");
		memberNewPwLabel.setFont(new Font("맑은 고딕", Font.PLAIN, 10));
		memberNewPwLabel.setBounds(76, 120, 57, 15);
		add(memberNewPwLabel);
		
		memberPhoneLabel = new JLabel("핸드폰 번호");
		memberPhoneLabel.setFont(new Font("맑은 고딕", Font.PLAIN, 10));
		memberPhoneLabel.setBounds(76, 151, 57, 15);
		add(memberPhoneLabel);
		
		memberBirthdateLabel = new JLabel("생년월일");
		memberBirthdateLabel.setFont(new Font("맑은 고딕", Font.PLAIN, 10));
		memberBirthdateLabel.setBounds(76, 182, 57, 15);
		add(memberBirthdateLabel);

		//객체생성
	
		
		
		
	}//생성자끝
	
	//수정폼 활성화 메소드 (아이디, 생년월일 비활성화)
	private void updateFormEnable(boolean b) {
		infoIdTF.setEditable(false);
		infoPwTF.setEditable(true);
		infoPwUpdateTF.setEditable(true);
		infoPhoneTF.setEditable(true);
		infoBirthDateTF.setEditable(false);
		infoEmailTF.setEditable(true);
		infoNicknameTF.setEditable(true);
				
	}
	/*
	//내정보보기 클릭했을 때 로그인한 회원정보 뿌리는 메소드
	private void displayMemberInfo(Member member) {
		
		infoIdTF.setText(member.getId());
		infoPwTF.setText(member.getPw());
		infoPwUpdateTF.setText(member.getPwcheck());
		infoPhoneTF.setText(member.getPhone());
		infoBirthDateTF.setText(member.getBirthdate());
		infoEmailTF.setText(member.getEmail());
		infoNicknameTF.setText(member.getNickname());
		
	}
	*/

}//클래스끝

















