Received: from fgw21-7.mail.saunalahti.fi (fgw21-7.mail.saunalahti.fi [62.142.5.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0698199E8D
	for <linux-leds@vger.kernel.org>; Sat, 23 Nov 2024 19:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.82
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732390814; cv=none; b=FbIYpzBkNNGm3Vj3pqGrFylhSVu6ZdrvZKbXFN5waE/SpcBlt/ads6MlThyZgKl2Yjc14+MgXSZMHPi81Ji1x/ml85dTRs8UiW2X+DZG2LznH9EsL7KCAjV4LnUV0mNxysCsuavGY8BsMnfWqBfoXI1UGlrRt5RNnw1bYPYhQdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732390814; c=relaxed/simple;
	bh=tGySL+pnLhkfRyCkkOyfazm2HL3pcZogECrnTG3uD6A=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OZQFv2V36LVuDrlRHm2sWvqlJK0sPWl8mlq6LqNO6LfRQVU3vgI7Gvh4AIFie6vc9Uhm9maih0IUz17bGiOxuU8W9BcZtn9BXXjwaOD1PkTSbuoYKQpJBfr13Xxm4eKEiw0zzhOXQrEUH5uxA3zndayeCPM51GVhEkgWzUj3Jos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-25-143.elisa-laajakaista.fi [88.113.25.143])
	by fgw23.mail.saunalahti.fi (Halon) with ESMTP
	id bd3dc34a-a9d2-11ef-a0f6-005056bdfda7;
	Sat, 23 Nov 2024 21:40:06 +0200 (EET)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 23 Nov 2024 21:40:05 +0200
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Gene Chen <gene_chen@richtek.com>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 16/18] leds: tca6507: switch to
 device_for_each_child_node_scoped()
Message-ID: <Z0IvleO2ag1ktM4c@surfacebook.localdomain>
References: <20240927-leds_device_for_each_child_node_scoped-v1-0-95c0614b38c8@gmail.com>
 <20240927-leds_device_for_each_child_node_scoped-v1-16-95c0614b38c8@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240927-leds_device_for_each_child_node_scoped-v1-16-95c0614b38c8@gmail.com>

Fri, Sep 27, 2024 at 01:21:07AM +0200, Javier Carrasco kirjoitti:
> Switch to device_for_each_child_node_scoped() to simplify the code by
> removing the need for calls to fwnode_handle_put() in the error path.
> 
> This also prevents possible memory leaks if new error paths are added
> without the required call to fwnode_handle_put().

...

>  		ret = fwnode_property_read_u32(child, "reg", &reg);
> -		if (ret || reg >= NUM_LEDS) {
> -			fwnode_handle_put(child);
> +		if (ret || reg >= NUM_LEDS)
>  			return ERR_PTR(ret ? : -EINVAL);
> -		}

It's now two nested conditionals instead of two independent ones:

		if (ret)
			return ERR_PTR(ret);
		if (reg >= NUM_LEDS)
			return ERR_PTR(-EINVAL);

I believe my wariant is much better to read, understand, and maintain.

-- 
With Best Regards,
Andy Shevchenko


