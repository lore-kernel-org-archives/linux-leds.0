From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [GIT PULL] LED subsystem updates for 4.6
Date: Tue, 15 Mar 2016 22:15:23 -0700
Message-ID: <CA+55aFzzz2sj-EjfsUDjnsKhbM2AjjxwjQXRpueMFauRGZgiGQ@mail.gmail.com>
References: <1457951097-27079-1-git-send-email-j.anaszewski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1457951097-27079-1-git-send-email-j.anaszewski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux LED Subsystem <linux-leds@vger.kernel.org>, amitoj1606@gmail.com, ao2@ao2.it, drivshin@allworx.com, Geert Uytterhoeven <geert+renesas@glider.be>, hkallweit1@gmail.com, stefan.wahren@i2se.com, Wei Yongjun <yongjun_wei@trendmicro.com.cn>
List-Id: linux-leds@vger.kernel.org

On Mon, Mar 14, 2016 at 3:24 AM, Jacek Anaszewski
<j.anaszewski@samsung.com> wrote:
>
> New LED class driver:
>
> - Add driver for the ISSI IS31FL32xx family of LED controllers.

Grr. This has apparently not gotten with the program, and causes a few
annoying warnings:

drivers/leds/leds-is31fl32xx.c: In function =E2=80=98is31fl32xx_parse_c=
hild_dt=E2=80=99:
drivers/leds/leds-is31fl32xx.c:345:30: warning: passing argument 1 of
=E2=80=98of_property_read_string=E2=80=99 discards =E2=80=98const=E2=80=
=99 qualifier from pointer
target type [-Wdiscarded-qualifiers]
  if (of_property_read_string(child, "label", &cdev->name))
                              ^

(there's another at line 357)

I've pulled, but I'll expect this to be fixed.

              Linus
