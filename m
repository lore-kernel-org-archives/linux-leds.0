From: syzbot <syzbot+9880e421ec82313d6527@syzkaller.appspotmail.com>
Subject: Re: INFO: task hung in do_exit
Date: Sat, 13 Apr 2019 19:55:00 -0700
Message-ID: <00000000000074e9d5058674a94f@google.com>
References: <000000000000e02bf505866414ae@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <000000000000e02bf505866414ae@google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: amitoj1606@gmail.com, ap420073@gmail.com, avagin@gmail.com, dbueso@suse.de, ebiederm@xmission.com, jacek.anaszewski@gmail.com, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, linux-mm@kvack.org, oleg@redhat.com, pavel@ucw.cz, prsood@codeaurora.org, rpurdie@rpsys.net, syzkaller-bugs@googlegroups.com, tj@kernel.org
List-Id: linux-leds@vger.kernel.org

syzbot has bisected this bug to:

commit 430e48ecf31f4f897047f22e02abdfa75730cad8
Author: Amitoj Kaur Chawla <amitoj1606@gmail.com>
Date:   Thu Aug 10 16:28:09 2017 +0000

     leds: lm3533: constify attribute_group structure

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=15f4cee3200000
start commit:   8ee15f32 Merge tag 'dma-mapping-5.1-1' of git://git.infrad..
git tree:       upstream
final crash:    https://syzkaller.appspot.com/x/report.txt?x=17f4cee3200000
console output: https://syzkaller.appspot.com/x/log.txt?x=13f4cee3200000
kernel config:  https://syzkaller.appspot.com/x/.config?x=4fb64439e07a1ec0
dashboard link: https://syzkaller.appspot.com/bug?extid=9880e421ec82313d6527
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=149b89af200000

Reported-by: syzbot+9880e421ec82313d6527@syzkaller.appspotmail.com
Fixes: 430e48ecf31f ("leds: lm3533: constify attribute_group structure")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
