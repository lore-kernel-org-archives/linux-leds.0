From: Stewart Smith <stewart@linux.vnet.ibm.com>
Subject: Re: [PATCH v2 2/2] leds/powernv: Add driver for PowerNV platform
Date: Tue, 28 Apr 2015 16:59:18 +1000
Message-ID: <m3zj5slovt.fsf@oc8180480414.ibm.com>
References: <20150422234509.626d9dc7@ja.home> <55388254.4000606@linux.vnet.ibm.com> <20150423161342.55e9ac8f@ja.home> <m3egnama5l.fsf@oc8180480414.ibm.com> <20150424121629.69a159b3@ja.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from e18.ny.us.ibm.com ([129.33.205.208]:37401 "EHLO
	e18.ny.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751348AbbD1G7z (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 28 Apr 2015 02:59:55 -0400
Received: from /spool/local
	by e18.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-leds@vger.kernel.org> from <stewart@linux.vnet.ibm.com>;
	Tue, 28 Apr 2015 02:59:54 -0400
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com [9.57.198.27])
	by d01dlp03.pok.ibm.com (Postfix) with ESMTP id 0460FC90045
	for <linux-leds@vger.kernel.org>; Tue, 28 Apr 2015 02:50:31 -0400 (EDT)
Received: from d01av02.pok.ibm.com (d01av02.pok.ibm.com [9.56.224.216])
	by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id t3S6xMba59703388
	for <linux-leds@vger.kernel.org>; Tue, 28 Apr 2015 06:59:22 GMT
Received: from d01av02.pok.ibm.com (localhost [127.0.0.1])
	by d01av02.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id t3S6xKW9011746
	for <linux-leds@vger.kernel.org>; Tue, 28 Apr 2015 02:59:21 -0400
In-Reply-To: <20150424121629.69a159b3@ja.home>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski81@gmail.com>
Cc: linux-leds@vger.kernel.org, cooloney@gmail.com, rpurdie@rpsys.net, linuxppc-dev@lists.ozlabs.org, khandual@linux.vnet.ibm.com

Jacek Anaszewski <j.anaszewski81@gmail.com> writes:
> Is the DT node we are discussing used by some other drivers than the
> LED class driver? Or is it required in this form by other components of
> your platform?

OS kernels are the chief consumers, Linux being the overwhelmingly major
one here.

But this is what firmware currently produces.

Changing the DT representation at this stage is perhaps *possible*
without creating a bunch of pain (I'd have to audit a bunch of things to
see if we have GA shipping systems with this functionality for instance,
and then evaluate the impact to partners and our various labs) which is
a lot of work I don't particularly want to do and is well below urgent
item 248 on my TODO list, especially for what seems to be largely a
cosmetic suggestion?

That being said, more and better review of things we're putting in the
device tree in firmware is probably a good thing. After all, once we
release we do kind of have to live with it essentially forever. If
people are able to aid in that kind of code review, I'd be most welcome
to hear it.
