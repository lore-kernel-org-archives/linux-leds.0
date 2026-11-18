Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794987185;
	b=bC0ngYpeTqotKB6zgaEJcvf7gxfHRasZmdpbG/5ZgYugzILYtvqVspYeseTESE9rBeN0
	 ll9ceUzuKqpgImbUFwfexkKszw0c51YrVXvSKYJ+nmeB4hOXqDbLRBHM09dt0bIdsnZps
	 pw643RSSMQIoaMJF+oCo71h2bv951iVRoqbI3lXcHy0swe1glMeWalcJ444ARBU0k1Vnq
	 7DN90m6hzTJ128FQ8nQ7t0SXCkHS7GQKY1EimmFX1cRh85/lqvu/93d4DHhSopWkKdFJH
	 bn2ikApXwI2Dbh9TcASpF8pSxRhBUsrwxB1ybNaSyYjq8Ye2AqYK1YUs4b4ItDp1GFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794987185;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=HiEu4LZd3Ao/KbACuz/hUS8GT8xNWhAypNsxwOQEF+g=;
	b=GPzdSVEDYgx9/3Ma8KOj0AG7PxsEDv/JQu3R65S7gTjvdDTTGyv/737yIX1nbWgC1VXP
	 HrrDG5AaK7etw6ti6SSbncaZJIJ6++DC4BMucVIQ1Z6mOTOSUMtXQm/RlTmURx0oAw97e
	 AsxGgsCFF2xeUl6+vGAXByemqeUWgb6A5DvbRT/9rG+mhsq0s/Y7XhhVU34zM2pC6vFW5
	 Wu/UZG3T/8CUr2zmS4wVu7hpnafM1+9Pf1N2c7rxkWrkyqyh/mNHWFVOtEgMuDRoc2k6n
	 tPIRs9BO/tIzSh6AjLJgg3HrHVtU1e3APj19Ox9V3W2O6kgicpNPWvTG+0ALVKQyWYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AYVv1saW;
	arc=none smtp.remote-ip=198.175.65.20
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4235606A33E;
	Wed, 18 Nov 2026 07:33:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4235606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AYVv1saW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794987185; x=1826523185;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=clMY5POap+ZRReFu4rR5bNpILFYOxfv4eZM5pgczG1Y=;
  b=AYVv1saWVwrQtRpUF/5IzOvpJEvbUilQj8BMFZbX/58eOUhUuLmrH2qQ
   o676eDKV1G9QkrBq/nhMEISTL7UtuRXigNsnDU0PgVHDEqpnsilij6UDi
   1myJw12VqUuSohtH/bTdWZrz7JXvGpRjF2aEt9sjgvW4cXplbLXAuCH/b
   T6EcBOBJ4f8dvJ2XVNFHFyEcdg2xW8RPSFmBH5SNx/dGXVTsgqpsehPN2
   J8/2NDBBOVkLqbWQ//xLKmSPbFf88iPjrEEzV6XxynBD6bhpZFBfFs6RG
   Zs31SqUAFcQ9d+FBnReM4QRmyw3no2jadUKCrnhW6snvdIUyKOP9nUzCE
   A==;
X-CSE-ConnectionGUID: E5Y+oY//TM6WEm0/7lxQ0w==
X-CSE-MsgGUID: QtddJhUjT32hAxN92KAeUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3825461"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3825461"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2026 23:32:23 -0800
X-CSE-ConnectionGUID: 1hKs2KpOQPK0RQrttMlb2g==
X-CSE-MsgGUID: JdcA7C+lRgOuA7zzS+TRjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="10310523"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.157])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2026 23:32:20 -0800
Date: Wed, 18 Nov 2026 09:32:18 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Volodymyr Chapman <volodymyrchapman@gmail.com>
Cc: lee@kernel.org, pavel@kernel.org, griffin@kroah.com, hansg@kernel.org,
	andy@kernel.org, linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] leds: flash: Add driver for the TI LM3554
Message-ID: <av1Ugv6BQYC3PS4Q@ashevche-desk.local>
References: <20261116180809.26946-1-volodymyrchapman@gmail.com>
 <20261117175745.11897-1-volodymyrchapman@gmail.com>
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
In-Reply-To: <20261117175745.11897-1-volodymyrchapman@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Nov 17, 2026 at 05:57:45PM +0000, Volodymyr Chapman wrote:
> Hi Lee, Pavel,
> 
> Andy Shevchenko pointed out, in review of a related camera series, that
> drivers/leds/leds-lm355x.c already lists the LM3554. I should have
> mentioned it in the commit message.
> 
> It can't be used on the Lenovo ThinkPad 10 as it is: it only probes with
> platform data (no ACPI or DT matching, and nothing in the tree provides
> the platform data), it does not drive the HWEN enable line, which has to
> be raised here before the chip responds, and it registers three plain
> LED class devices rather than a flash LED class device, so there is no
> flash timeout or fault reporting.
> 
> This patch follows commit f1aa35ab5943 ("media: atomisp: Drop the
> atomisp custom lm3554 flash driver"), which removed the atomisp-specific
> LM3554 driver for the same hardware and said that it should be
> re-implemented with the led-class-flash API if needed.
> 
> Would you prefer a separate flash class driver for the LM3554 as in this
> patch, or extending leds-lm355x (fwnode/ACPI matching, the enable GPIO
> and the flash class)? I'll do whichever you prefer in v2, together with
> the fixes for the issues the Sashiko review found.

Since lm355x has no fwnode support, I think we have no users for it
in kernel (there are no users of platform data either).

I would move the driver to the flash subfolder (and rename it back to lm3556
as all those 'x' variants showed quite a confusion for the users and developers
as we noticed in IIO and have now even requirement to not make any driver names
with wildcard in it) and develop necessary support.

Also the documentation Documentation/leds/leds-lm3556.rst needs to be amended.

-- 
With Best Regards,
Andy Shevchenko


