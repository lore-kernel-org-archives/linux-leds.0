From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: [PATCH v2 2/2] leds/powernv: Add driver for PowerNV platform
Date: Mon, 27 Apr 2015 19:53:55 +1000
Message-ID: <1430128435.16571.110.camel@kernel.crashing.org>
References: <20150422234509.626d9dc7@ja.home>
	 <55388254.4000606@linux.vnet.ibm.com> <20150423161342.55e9ac8f@ja.home>
	 <1430086038.16571.78.camel@kernel.crashing.org>
	 <553DE41A.5070703@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from gate.crashing.org ([63.228.1.57]:54329 "EHLO gate.crashing.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751252AbbD0Jyj (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Mon, 27 Apr 2015 05:54:39 -0400
In-Reply-To: <553DE41A.5070703@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: stewart@linux.vnet.ibm.com, cooloney@gmail.com, Vasant Hegde <hegdevasant@linux.vnet.ibm.com>, rpurdie@rpsys.net, linuxppc-dev@lists.ozlabs.org, linux-leds@vger.kernel.org, khandual@linux.vnet.ibm.com

On Mon, 2015-04-27 at 09:24 +0200, Jacek Anaszewski wrote:
> I was not aware that some other entity than the driver could be
> interested in the information provided by DT node. I will no longer
> object, provided that we will get an ack from DT maintainer.

My understanding is that we no longer need bindings to be accepted by DT
maintainers.

That being said, I would like to review this one before it is accepted,
as I haven't had a chance to do so yet :-) (I was mostly responding to
you, I haven't caught up with the full thread yet).

Please wait for an ack from myself or Michael Ellerman (the two powerpc
maintainers). Either that or provide your ack and we'll merge it via our
tree if we are happy with it.

Cheers,
Ben.
