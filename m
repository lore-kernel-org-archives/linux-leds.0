From: Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: [PATCH v2 0/4] LED trigger on MTD activity
Date: Thu, 14 Apr 2016 12:03:19 +0200
Message-ID: <20160414120319.02f5f859@bbrezillon>
References: <1460494002-8578-1-git-send-email-ezequiel@vanguardiasur.com.ar>
	<570E0506.4040705@samsung.com>
	<20160413203905.06371b4c@bbrezillon>
	<570F4AB1.2020600@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from down.free-electrons.com ([37.187.137.238]:42244 "EHLO
	mail.free-electrons.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1753408AbcDNKDW (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 14 Apr 2016 06:03:22 -0400
In-Reply-To: <570F4AB1.2020600@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, linux-mtd@lists.infradead.org, linux-leds@vger.kernel.org, Brian Norris <computersforpeace@gmail.com>

Hi Jacek,

On Thu, 14 Apr 2016 09:45:53 +0200
Jacek Anaszewski <j.anaszewski@samsung.com> wrote:

> Hi Boris,
> 
> On 04/13/2016 08:39 PM, Boris Brezillon wrote:
> > Hi Jacek,
> >
> > On Wed, 13 Apr 2016 10:36:22 +0200
> > Jacek Anaszewski <j.anaszewski@samsung.com> wrote:
> >
> >> Hi Ezequiel,
> >>
> >> Thanks for the update. From the previous discussion I've inferred
> >> that it has been agreed on the whole patch to go through the LED tree.
> >>
> >> Applied whole patch set to the for-next branch of linux-leds.git,
> >> with acks from Boris, then.
> >
> > Can you provide an immutable branch containing those changes?
> 
> No problem, I've created mtd-nand-trigger branch in the repository
> 
> git://git.kernel.org/pub/scm/linux/kernel/git/j.anaszewski/linux-leds.git
> 

I've merged this branch into nand/next.

Thanks,

Boris

-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
