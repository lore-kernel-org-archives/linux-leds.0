Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 278BF43C07F;
	Tue,  5 May 2026 13:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777987517; cv=none; b=PsLHkMtR1QvzQ8Ctty3R6JuP03IXTOKcyzoV642ZyMAJMoP1+TtL3PluraPbw62H+5c0MalHvrrN1Pw0PWb7cB8pIaPY/LdLKUE0rCBeDeGL0Pmmh/JQPbuc4phLqcXNPQJ7vyYA3mJproEKakfUPEo2LjAltjlQtoF8/OwCL58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777987517; c=relaxed/simple;
	bh=H17z3loZWw2eHoODtrEI+6JU+28MPAsGpsKoAP/rdQc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GDqKfWXuN4VmYcI4f6q85hZNqNL0C+yUsicveQNCPzIglJ7OM5haItm09o5AbOO9UHS5jvCx45FjvgmIzNCP+rBNBUVaWF69VOoiDdZz5L5/RGNx5WnwhWlV1g8g/4hHno90rxbiXQuNgTLoQT+9CHvKWnPWJKamGoF3CwXaA4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lQ3cMY9A; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lQ3cMY9A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777987516; x=1809523516;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=H17z3loZWw2eHoODtrEI+6JU+28MPAsGpsKoAP/rdQc=;
  b=lQ3cMY9AifCDuwduFQosopNNC1WMjQcSpSECm5tIB9nYJuk04rrM3/el
   sVNq2z3Y7nKPbSut/eNK6+2G0w1/9WC3hfcuV+VDidgscnBSza4BtO2qH
   CDJG1cRReBGPCiq4+vwkrR8JF1sURQCjOXqpXEm0APmkvJIWPz5ZIH1oX
   eL8Yn7pG3uoWScYq4FDQsZiU02ueZaNCXBY9VQyyoYTSPI61bCSFKVn9e
   GlE9f/3Rg5Nyf3PXdWjISLBgeJHEpltcE9ju+8JhqGzy+dLXJTNZ+7nPP
   LfuRffoY2zENJYk7x3YH2K3dxeZLnC7xogzfhrx7k+beWXUlDgqhO8hN6
   Q==;
X-CSE-ConnectionGUID: F2ma4i2uQyCpVWOsOSPvYQ==
X-CSE-MsgGUID: DaTKKKBsT7GOkvdGDd1dXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="104304951"
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; 
   d="scan'208";a="104304951"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2026 06:25:15 -0700
X-CSE-ConnectionGUID: /XjHYWvUSwGQ6gX30dTfLA==
X-CSE-MsgGUID: rgU/e1RJTDejaAA2A5G+zA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; 
   d="scan'208";a="239804133"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost) ([10.245.244.5])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2026 06:25:13 -0700
Date: Tue, 5 May 2026 16:25:10 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Arnd Bergmann <arnd@kernel.org>, Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>, Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH] [v2] leds: gpio: make legacy gpiolib interface optional
Message-ID: <afnvtid9rSoZ2dkQ@ashevche-desk.local>
References: <20260430091202.2724109-1-arnd@kernel.org>
 <afhLS6xwHGm9_mLy@ashevche-desk.local>
 <bfecac99-3ec1-473a-bd5f-e49ae48aebf3@app.fastmail.com>
 <afnuY6IPvC7dgUC9@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <afnuY6IPvC7dgUC9@ashevche-desk.local>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, May 05, 2026 at 04:19:36PM +0300, Andy Shevchenko wrote:
> On Tue, May 05, 2026 at 03:10:28PM +0200, Arnd Bergmann wrote:
> > On Mon, May 4, 2026, at 09:31, Andy Shevchenko wrote:
> > > On Thu, Apr 30, 2026 at 11:11:55AM +0200, Arnd Bergmann wrote:

...

> > >> +	return gpiod;
> > >
> > > Do we need to repeat the upper `return gpiod;` statement? With this split
> > > I don't see that we need to have two repetitive return statements.
> > 
> > Right, I've simplified this now to
> > 
> > static struct gpio_desc *gpio_led_get_gpiod(struct device *dev, int idx,
> >                                            const struct gpio_led *template)
> > {
> >        struct gpio_desc *gpiod;
> > 
> >        gpiod = devm_gpiod_get_index_optional(dev, NULL, idx, GPIOD_OUT_LOW);
> 
> >        if (gpiod && !IS_ERR(gpiod));
> 
> And this is not needed. The below is NULL-aware.
> 
> >                gpiod_set_consumer_name(gpiod, template->name);
> > 
> >        return gpiod;
> > }

To be clear

        struct gpio_desc *gpiod;

        gpiod = devm_gpiod_get_index_optional(dev, NULL, idx, GPIOD_OUT_LOW);
        if (!IS_ERR(gpiod))
                gpiod_set_consumer_name(gpiod, template->name);

        return gpiod;

But looking at the original code, I would leave another return, so

	gpiod = devm_gpiod_get_index_optional(dev, NULL, idx, GPIOD_OUT_LOW);
	if (IS_ERR(gpiod))
		return gpiod;

	gpiod_set_consumer_name(gpiod, template->name);
	return gpiod;

> > which still keeps the existing behavior but is a bit more compact.
> > 
> > I think we can actually just remove that function altogether
> > and just pass the name into devm_gpiod_get_index_optional()
> > from the caller like
> > 
> >   gpiod = devm_gpiod_get_index_optional(dev, template->name, i, GPIOD_OUT_LOW);
> > 
> > Did I get that right? If so, I'll fold that in as another

Nope, the con_id != consumer name. Can't be done this way.

> > simplification.

-- 
With Best Regards,
Andy Shevchenko


