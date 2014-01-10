From: Bryan Wu <cooloney@gmail.com>
Subject: Re: [GIT PULL] LED fix for 3.13
Date: Fri, 10 Jan 2014 14:59:52 -0800
Message-ID: <CAK5ve-LLdzEErKdDFoAb8kCLx7GMX5nXvO6opLzm4ZR0M-3dhw@mail.gmail.com>
References: <CAK5ve-L4=uJmJfF67pR+jL1L532XP28FVmn=CTwWbDY2pUiPoA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAK5ve-L4=uJmJfF67pR+jL1L532XP28FVmn=CTwWbDY2pUiPoA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>, Linux LED Subsystem <linux-leds@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

My email was bounced back by LKML and Linux LED mail list. I forget to
use plain text mode. So I forward it again.

Thanks,
-Bryan

On Fri, Jan 10, 2014 at 2:57 PM, Bryan Wu <cooloney@gmail.com> wrote:
>
> Hi Linus,
>
> Pali Roh=E1r and Pavel Machek reported the LED of Nokia N900 doesn't =
work with our latest 3.13-rc6 kernel. Milo fixed the regression here.
>
> So please consider the following changes since commit 802eee95bde72fd=
0cd0f3a5b2098375a487d1eda:
>
>   Linux 3.13-rc6 (2013-12-29 16:01:33 -0800)
>
> are available in the git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/cooloney/linux-leds.g=
it leds-fixes-for-3.13
>
> for you to fetch changes up to e70988d1aaf73221355e06125c9937bd4b2776=
1c:
>
>   leds: lp5521/5523: Remove duplicate mutex (2014-01-10 14:48:07 -080=
0)
>
> ----------------------------------------------------------------
> Milo Kim (1):
>       leds: lp5521/5523: Remove duplicate mutex
>
>  drivers/leds/leds-lp5521.c | 12 ++++--------
>  drivers/leds/leds-lp5523.c | 12 ++++--------
>  2 files changed, 8 insertions(+), 16 deletions(-)
