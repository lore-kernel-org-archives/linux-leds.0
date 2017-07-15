From: Julia Lawall <julia.lawall@lip6.fr>
Subject: Re: [PATCH] leds: tlc591xx: add missing of_node_put
Date: Sat, 15 Jul 2017 11:09:52 +0200 (CEST)
Message-ID: <alpine.DEB.2.20.1707151109180.2838@hadrien>
References: <1500104933-25286-1-git-send-email-Julia.Lawall@lip6.fr> <20170715090223.GA21365@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail3-relais-sop.national.inria.fr ([192.134.164.104]:64339
        "EHLO mail3-relais-sop.national.inria.fr" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751145AbdGOJJz (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Sat, 15 Jul 2017 05:09:55 -0400
In-Reply-To: <20170715090223.GA21365@amd>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Richard Purdie <rpurdie@rpsys.net>, kernel-janitors@vger.kernel.org, Jacek Anaszewski <jacek.anaszewski@gmail.com>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org



On Sat, 15 Jul 2017, Pavel Machek wrote:

> On Sat 2017-07-15 09:48:53, Julia Lawall wrote:
> > for_each_child_of_node performs an of_node_get on each iteration, so a
> > return from the loop requires an of_node_put.
> >
> > The semantic patch that fixes this problem is as follows
> > (http://coccinelle.lip6.fr):
> >
> > // <smpl>
> > @@
> > local idexpression n;
> > expression e,e1;
> > iterator name for_each_child_of_node;
> > @@
> >
> >  for_each_child_of_node(e1,n) {
> >    ...
> > (
> >    of_node_put(n);
> > |
> >    e = n
> > |
> >    return n;
> > |
> > +  of_node_put(n);
> > ?  return ...;
> > )
> >    ...
> >  }
> > // </smpl>
> >
> > Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
>
> Acked-by: Pavel Machek <pavel@ucw.cz>
>
> > @@ -230,12 +230,18 @@ tlc591xx_probe(struct i2c_client *client
> >
> >  	for_each_child_of_node(np, child) {
> >  		err = of_property_read_u32(child, "reg", &reg);
> > -		if (err)
> > +		if (err) {
> > +			of_node_put(child);
> >  			return err;
> > -		if (reg < 0 || reg >= tlc591xx->max_leds)
> > +		}
> > +		if (reg < 0 || reg >= tlc591xx->max_leds) {
> > +			of_node_put(child);
> >  			return -EINVAL;
> > -		if (priv->leds[reg].active)
> > +		}
> > +		if (priv->leds[reg].active) {
> > +			of_node_put(child);
> >  			return -EINVAL;
> > +		}
>
> I'd combine last two if()s into one...

The test won't all fit on one line.  Should I do it anyway?

julia
