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
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;
import java.awt.Font;
import javax.swing.JLabel;

public class MemberLoginPanel extends JPanel {
	CoffeeCrewMainFrame coffeeCrewMainFrame;
	
	private JTextField loginIdTF;
	private JPasswordField loginPwTF;
	
	private TabbedPane shopTabbedPane;
	memberTabbedPane

	/**
	 * Create the panel.
	 */
	public MemberLoginPanel() {
		setBackground(new Color(255, 255, 255));
		setLayout(null);
		
		loginIdTF = new JTextField();
		loginIdTF.setBounds(150, 97, 139, 33);
		add(loginIdTF);
		loginIdTF.setColumns(10);

		loginPwTF = new JPasswordField();
		loginPwTF.setBounds(150, 169, 139, 33);
		add(loginPwTF);
		loginPwTF.setColumns(10);
		
		JButton loginLoginButton = new JButton("로그인");
		loginLoginButton.setFont(new Font("맑은 고딕", Font.PLAIN, 12));
		loginLoginButton.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				
				//회원 로그인
				//앱을 실행시키면 가장 먼저 보이는 화면
				try {
					MemberService memberService = new MemberService();
					String id = loginIdTF.getText();
					String password = loginPwTF.getText();
					Member loginMember = memberService.login(id, password);
					
					//정보를 입력했는지
					if(id.equals("") || password.equals("")) {
						JOptionPane.showMessageDialog(null, "내용을 입력하세요");
						return;	
					}
					
					//로그인
					if(loginMember != null) {
						JOptionPane.showMessageDialog(null,"로그인에 성공하셨습니다");
						loginIdTF.setText("");
						loginPwTF.setText("");
						
						/***** 로그인 성공하면 호출할 메소드 *****/
						coffeeCrewMainFrame.changePanel(CoffeeCrewMainFrame.TOP_SHOP_MAIN_PANEL, 0, loginMember);
						coffeeCrewMainFrame.loginProcess(loginMember);
						
						shopTabbedPane.setEnabledAt(3, true); // 주문 탭
						memberTabbedPane.setEnabledAt(0, false); //로그인탭 활성화
						memberTabbedPane.setEnabledAt(1, false); //회원가입탭 활성화
						memberTabbedPane.setEnabledAt(2, false); //회원정보탭 불활성화
						memberTabbedPane.setEnabledAt(3, false); //아이디/비밀번호찾기탭 불활성화
						
						
						/*****************************************/
						
					}else {
						JOptionPane.showMessageDialog(null, "아이디 또는 비밀번호를 잘못 입력하셨습니다");
						loginIdTF.requestFocus();
						loginIdTF.setText("");
						loginPwTF.setText("");
					}
				} catch (Exception e1) {
					e1.printStackTrace();
				}
				
			}
		});
		loginLoginButton.setBounds(89, 234, 200, 33);
		add(loginLoginButton);
		
		JButton loginJoinButton = new JButton("회원가입");
		loginJoinButton.setFont(new Font("맑은 고딕", Font.PLAIN, 12));
		loginJoinButton.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseClicked(MouseEvent e) {
				
				/******** 버튼 클릭 시 회원가입 화면으로 이동합니다 ********/
				coffeeCrewMainFrame.changePanel(1, 1, null);
				
			}
		});
		loginJoinButton.setBounds(89, 277, 200, 33);
		add(loginJoinButton);
		
		JButton loginFindButton = new JButton("아이디/비밀번호 찾기");
		loginFindButton.setFont(new Font("맑은 고딕", Font.PLAIN, 12));
		loginFindButton.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseClicked(MouseEvent e) {
				
				/******** 버튼 클릭 시 아이디/비밀번호 찾기 화면으로 이동합니다 ********/
				coffeeCrewMainFrame.changePanel(1, 3, null);																																																																																																																																																																																			
				/**************************************************************/
				
			}
		});
		loginFindButton.setBounds(89, 320, 200, 33);
		add(loginFindButton);
		
		JLabel memberIdLabel = new JLabel("아이디");
		memberIdLabel.setFont(new Font("맑은 고딕", Font.PLAIN, 12));
		memberIdLabel.setBounds(89, 104, 57, 15);
		add(memberIdLabel);
		
		JLabel memberPwLabel = new JLabel("비밀번호");
		memberPwLabel.setFont(new Font("맑은 고딕", Font.PLAIN, 12));
		memberPwLabel.setBounds(89, 176, 57, 15);
		add(memberPwLabel);

	}//생성자끝

	public void setCoffeeCrewMainFrame(CoffeeCrewMainFrame coffeeCrewMainFrame) {
		this.coffeeCrewMainFrame = coffeeCrewMainFrame;
	}
	
	/************** 로그아웃하면 호출할 메소드 (활성화, 비활성화) ***************
	private void logoutProcess() {
		
		Member loginMember = null;
		setTitle("COFFEECREW");
		
		//로그인, 회원가입 활성화
		memberTabbedPane.setEnabledAt(1, true);
		memberTabbedPane.setEnabledAt(2,true);
		
		//회원정보 수정 비활성화
		memberTabbedPane.setEnabledAt(3, false);
		
		//로그인 메뉴아이템 활성화
		mntmNewMenuItem.setEnabled(true);
		
		//로그아웃 메뉴아이템 비활성화
		mntmNewMenuItem_1.setEnabled(false);
		
		//로그인 화면으로 이동
		memberTabbedPane.setSelectedIndex(1);
		
	}
	/*******************************************************/
	
	/************** 로그인하면 호출할 메소드 (활성화, 비활성화) ***************
	private void loginProcess(Member loginMember) {
		
		Member member = loginMember;
		setTitle(loginMember.getId()+" 님 로그인");
		
		//로그인, 회원가입 비활성화
		memberTabbedPane.setEnabledAt(1, false);
		memberTabbedPane.setEnabledAt(2,false);
		
		//회원정보 수정 활성화
		memberTabbedPane.setEnabledAt(3, true);
		
		//로그인 메뉴아이템 비활성화
		mntmNewMenuItem.setEnabled(false);
		
		//로그아웃 메뉴아이템 활성화
		mntmNewMenuItem_1.setEnabled(true);
		
		//메인 화면으로 이동
		memberTabbedPane.setSelectedIndex(0);
		
	}
	/*******************************************************/

}//클래스끝
