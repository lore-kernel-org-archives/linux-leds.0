Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793786302;
	b=vSKFdJMAv9JdDGAzBVqzMwrwLEl8arww7S9DeJOSgRhhxny8uQTwfqSFeUFHBQNr6IJ8
	 7xfnB0xXgKOicU9Af2xT0+mpxn5Q/2E148mDQLXahG9PUatEDiytlM4xEFrfKenY1DTuJ
	 vcw1TR3k1yKVrW9qc8/339nwEyUzkYlNJPUlOL4tI8kmf+EEWrFboE/R+P3fC+eJcgnDS
	 0JKjbkdXXv0YRNPEBNem8/LMotFTs6ss3KITK5gnW/vl0S1rA8SN2K0IvBjC7QJg47Lrg
	 rZUzas+ApGeomxaj3kneqmumDkPCjVPuT5/dNY3w7WkDDhJajihVHK4L7G2c03jGbug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793786302;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=wYX9CNNzAGxNn6Q0oBOkNNFbvJ1na7bYbyOb0MCsbr8=;
	b=dupxEeBrbFnur0MNnv6OD0MqSlTvOsCoPAt70nfa+lPr6fygSiZ7IEsBVikwU+1kcnnG
	 HWF9bfxRMRUj+xcQoI6qFfivEhSKogfkRYhL12240teTSV7P/JHzgjNh/av8NutM8J08H
	 2LuLMAO2tnGZFvrbrANU7cq34W9/M3xZElLK4jHHIhop0xv5+iHXlNBoxSayg/RTQPl2P
	 01Co70BQpRUipV+lH/amK1yDYtsiPMogo1EotzgxSCjWxPoYbk1Ljv1LWnu/j46fFbbDH
	 VkRnpGyAO760qylNfitIr03P3AP2D2i3gi6Z9Rk7v3NW39+9A/HbYt1rUQO8LKK+gTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IHte1FGe;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABEEB606A31B;
	Wed,  4 Nov 2026 09:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IHte1FGe
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25CFE1F00A15;
	Wed,  4 Nov 2026 09:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793786301;
	bh=wYX9CNNzAGxNn6Q0oBOkNNFbvJ1na7bYbyOb0MCsbr8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IHte1FGeGwhF/ZF+RWMq9jfiBpfreKZv2AInQfnKhGzykpbyvgpdGe2nLAZeevpCl
	 pB6NbmboEo/Os3JlBxg3K8XyACS4iE+ebbhfbfPiwtmR2XxpCy1Glk+WOS/7TSxnHM
	 YrR3EJxuvMt7T7GmgWUv4OSpUheS/g2xfvnmxZ/7d9YZojcs5P9GveB4HGzRhoQ8m9
	 SnrZmEaQ3dHpcNuTYNC6xib+w0k/s144T4eXQAVihXuiMBhwG+YdvAgMt1Iu+cYVRU
	 abwoWciskko21g1jXqoh8qyIQK0z/KIp0RzD263heISMDvp9u6zsMkBIFEdgBIt3y/
	 bEePjdgkJQvww==
Date: Wed, 4 Nov 2026 09:58:17 +0000
From: Lee Jones <lee@kernel.org>
To: Selby Mashiki <mashikiselby@gmail.com>
Cc: Pavel Machek <pavel@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>, linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] leds: lp50xx, max77705: use
 fwnode_for_each_child_node_scoped() to fix fwnode leaks
Message-ID: <20261104095817.GH792264@google.com>
References: <20261025190331.449462-1-mashikiselby@gmail.com>
 <179310024021.2808517.14377467825396336498@kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <179310024021.2808517.14377467825396336498@kernel.org>

On Sun, 25 Oct 2026, Lee Jones wrote:

> On Sun, 25 Oct 2026, Selby Mashiki wrote:
> 
> > In lp50xx_probe_dt(), the inner fwnode_for_each_child_node(child,
> > led_node) loop returns -EINVAL on two error paths (when reading "reg"
> > fails or multi_index is out of bounds) without calling
> > fwnode_handle_put(led_node), leaking the child reference.
> >
> > Similarly, in max77705_add_led(), fwnode_for_each_child_node(np, child)
> > returns early when max77705_parse_subled() fails without calling
> > fwnode_handle_put(child).
> >
> > Switch both loops to fwnode_for_each_child_node_scoped() and drop the
> > manual fwnode_handle_put() and loop cursor declarations so references
> > are automatically released on all exit paths.
> >
> > Fixes: 242b81170fb8 ("leds: lp50xx: Add the LP50XX family of the RGB LED driver")
> > Fixes: aebb5fc9a0d8 ("leds: max77705: Add LEDs support")
> > Signed-off-by: Selby Mashiki <mashikiselby@gmail.com>
> > ---
> >  drivers/leds/leds-lp50xx.c   | 4 +---
> >  drivers/leds/leds-max77705.c | 3 +--
> >  2 files changed, 2 insertions(+), 5 deletions(-)

One patch per driver please.

Also, the second driver has already been fixed.  Please rebase.

> > diff --git a/drivers/leds/leds-lp50xx.c b/drivers/leds/leds-lp50xx.c
> > index 20bfb315b..d542eedd4 100644
> > --- a/drivers/leds/leds-lp50xx.c
> > +++ b/drivers/leds/leds-lp50xx.c
> > @@ -458,7 +458,6 @@ static int lp50xx_probe_leds(struct fwnode_handle *child, struct lp50xx *priv,
> >
> >  static int lp50xx_probe_dt(struct lp50xx *priv)
> >  {
> > -	struct fwnode_handle *led_node = NULL;
> >  	struct led_init_data init_data = {};
> >  	struct led_classdev *led_cdev;
> >  	struct mc_subled *mc_led_info;
> > @@ -505,12 +504,11 @@ static int lp50xx_probe_dt(struct lp50xx *priv)
> >  		if (!mc_led_info)
> >  			return -ENOMEM;
> >
> > -		fwnode_for_each_child_node(child, led_node) {
> > +		fwnode_for_each_child_node_scoped(child, led_node) {
> >  			int multi_index;
> >  			ret = fwnode_property_read_u32(led_node, "color",
> >  						       &color_id);
> >  			if (ret) {
> > -				fwnode_handle_put(led_node);
> >  				dev_err(priv->dev, "Cannot read color\n");
> >  				return ret;
> >  			}
> > diff --git a/drivers/leds/leds-max77705.c b/drivers/leds/leds-max77705.c
> > index 1e2054c1b..4fd803c95 100644
> > --- a/drivers/leds/leds-max77705.c
> > +++ b/drivers/leds/leds-max77705.c
> > @@ -160,7 +160,6 @@ static int max77705_add_led(struct device *dev, struct regmap *regmap, struct fw
> >  	struct max77705_led *led;
> >  	struct led_classdev *cdev;
> >  	struct mc_subled *info;
> > -	struct fwnode_handle *child;
> >  	struct led_init_data init_data = {};
> >
> >  	led = devm_kzalloc(dev, sizeof(*led), GFP_KERNEL);
> > @@ -191,7 +190,7 @@ static int max77705_add_led(struct device *dev, struct regmap *regmap, struct fw
> >  		cdev->brightness_set_blocking = max77705_led_brightness_set_multi;
> >  		cdev->blink_set = max77705_rgb_blink;
> >
> > -		fwnode_for_each_child_node(np, child) {
> > +		fwnode_for_each_child_node_scoped(np, child) {
> >  			ret = max77705_parse_subled(dev, child, &info[i]);
> >  			if (ret < 0)
> >  				return ret;
> > -- 
> > 2.56.0
> >
> 
> -- 
> Lee Jones

-- 
Lee Jones
