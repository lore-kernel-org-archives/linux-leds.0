From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [patch 2/2 v2] leds: netxbig: silence a static checker warning
Date: Mon, 13 Apr 2015 13:16:23 +0300
Message-ID: <20150413101623.GL16501@mwanda>
References: <20150410083040.GA2189@mwanda>
 <5527DBBA.9060109@samsung.com>
 <20150410143056.GI16501@mwanda>
 <20150410144123.GI1509@kw.sim.vm.gnt>
 <20150410155034.GK16501@mwanda>
 <20150410195224.GJ1509@kw.sim.vm.gnt>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from aserp1040.oracle.com ([141.146.126.69]:34799 "EHLO
	aserp1040.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753548AbbDMKQu (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 13 Apr 2015 06:16:50 -0400
Content-Disposition: inline
In-Reply-To: <20150410195224.GJ1509@kw.sim.vm.gnt>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Simon Guinot <simon.guinot@sequanux.org>
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, linux-leds@vger.kernel.org, kernel-janitors@vger.kernel.org

The subject of this patch is "silence a static checker warning."  I'm
just not going to send patches to deliberately introduce static checker
warnings.  :P  Forget about it.

This is like those patches that Markus Elfring sent removing if
conditions.  It seems like it should make the code shorter an more
simple to remove code but it actually makes the code more subtle and
difficult to understand.

regards,
dan carpenter
