From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [GIT PULL] LED subsystem updates for 4.4
Date: Mon, 2 Nov 2015 16:16:08 -0800
Message-ID: <CA+55aFyTbWVVJBcu4zBThzCY0Vpo6E41wxWoAJa-s28kf7AuTQ@mail.gmail.com>
References: <1446470866-26021-1-git-send-email-j.anaszewski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1446470866-26021-1-git-send-email-j.anaszewski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux LED Subsystem <linux-leds@vger.kernel.org>, falakreyaz@gmail.com, Ralf Baechle <ralf@linux-mips.org>, jiri.prchal@aksignal.cz, simon.guinot@sequanux.org, noltari@gmail.com, hs@denx.de, fmthoker@gmail.com, ingi2.kim@samsung.com, Julia Lawall <Julia.Lawall@lip6.fr>
List-Id: linux-leds@vger.kernel.org

On Mon, Nov 2, 2015 at 5:27 AM, Jacek Anaszewski
<j.anaszewski@samsung.com> wrote:
>
> Please pull LED updates for 4.4 merge cycle.

No.

Your repository is bogus.

I don't know what the hell you have done or why you have done it, but
you have actually rebased *my* 4-3-rc7 commit that updates the
Makefile from rc6 to rc7:

 - commit 91ca3ce1b61f in your tree:

   Author: Linus Torvalds <torvalds@linux-foundation.org>  2015-10-24 18:39:47
   Committer: Jacek Anaszewski <j.anaszewski@samsung.com>  2015-10-28 04:12:17

      Linux 4.3-rc7

   diff --git a/Makefile b/Makefile:
   -EXTRAVERSION = -rc6
   +EXTRAVERSION = -rc7

and there is no way I will take things like this.

                      Linus
