From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [patch 2/2 v2] leds: netxbig: silence a static checker warning
Date: Fri, 10 Apr 2015 18:50:34 +0300
Message-ID: <20150410155034.GK16501@mwanda>
References: <20150410083040.GA2189@mwanda>
 <5527DBBA.9060109@samsung.com>
 <20150410143056.GI16501@mwanda>
 <20150410144123.GI1509@kw.sim.vm.gnt>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <kernel-janitors-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150410144123.GI1509@kw.sim.vm.gnt>
Sender: kernel-janitors-owner@vger.kernel.org
To: Simon Guinot <simon.guinot@sequanux.org>
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, linux-leds@vger.kernel.org, kernel-janitors@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

I've looked at this some more.  Most of the places which call
of_property_read_u32_index() check the return code.  The ones that don't
mostly initialize their values going in.  The remainder introduce static
checker warnings like:

	drivers/clk/ti/divider.c:472 ti_clk_get_div_table()
	error: potentially using uninitialized 'val'.

These warnings cause me pain.  It calls of_get_property() earlier so
it won't return -EINVAL.  I don't know if it can return -ENODATA or
-EOVERFLOW?

I guess not.

Honestly, I hate ambigous code like this.  If it were just a clear bug
then I could fix it but I invest more time in ambiguous code and end
up not writing a patch.

regards,
dan carpenter

