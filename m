From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [GIT PULL] LED subsystem updates for 4.4
Date: Tue, 3 Nov 2015 11:42:33 +1100
Message-ID: <20151103114233.05bfd9b6@canb.auug.org.au>
References: <1446470866-26021-1-git-send-email-j.anaszewski@samsung.com>
	<CA+55aFyTbWVVJBcu4zBThzCY0Vpo6E41wxWoAJa-s28kf7AuTQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:42002 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751478AbbKCAmk (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Mon, 2 Nov 2015 19:42:40 -0500
In-Reply-To: <CA+55aFyTbWVVJBcu4zBThzCY0Vpo6E41wxWoAJa-s28kf7AuTQ@mail.gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux LED Subsystem <linux-leds@vger.kernel.org>, falakreyaz@gmail.com, Ralf Baechle <ralf@linux-mips.org>, jiri.prchal@aksignal.cz, simon.guinot@sequanux.org, noltari@gmail.com, hs@denx.de, fmthoker@gmail.com, ingi2.kim@samsung.com, Julia Lawall <Julia.Lawall@lip6.fr>

Hi Linus,

On Mon, 2 Nov 2015 16:16:08 -0800 Linus Torvalds <torvalds@linux-foundation.org> wrote:
>
> On Mon, Nov 2, 2015 at 5:27 AM, Jacek Anaszewski
> <j.anaszewski@samsung.com> wrote:
> >
> > Please pull LED updates for 4.4 merge cycle.  
> 
> No.
> 
> Your repository is bogus.
> 
> I don't know what the hell you have done or why you have done it, but
> you have actually rebased *my* 4-3-rc7 commit that updates the
> Makefile from rc6 to rc7:

Sorry about that, I normally notice these things and complain.  My only
excuse is that it happened while we at KS and I was tired on Sunday :-)

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
