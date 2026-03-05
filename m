Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D558D3A0E8E
	for <linux-leds@vger.kernel.org>; Thu,  5 Mar 2026 13:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772718947; cv=none; b=q+x+0qytR+fT2xDfwDF0kyAluTtcl2PtCE9ks4rpZullP75OIXvBlAmg3WQq7ZviPEDl/6iMkb+Tt9ZYfsL0hi3m3XG9h17CQCXJbBRQTL7iR36VrwDhVe9yCM0czfbCBFaONOkDNysiu9s/DkDZEzOxBYGonK2bYQYtcmRQNYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772718947; c=relaxed/simple;
	bh=sZ2+g/y7asUrm4XI52DgLZKMYPJ+iavk+nTKHWGyeBg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lx8nw2xBC9Tu04URGxOivpDBdKMrAqDoL9zQEXAdhwKbflyfzpVyUYP2h6WyaejIdHwuN5A/bdM46DQDF2CRMkvrcMTaL/zhmnjfpo/keAz80GyZA6vQ9zXHcLFEygEbKATgSzWcY/+QkZNhxVwrvVBNU7gz5TLbhCEcBRCFxgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S05vkSkv; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S05vkSkv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772718946; x=1804254946;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sZ2+g/y7asUrm4XI52DgLZKMYPJ+iavk+nTKHWGyeBg=;
  b=S05vkSkvjvkrbnqBea+9kW85jNQtiWTfe91hBPKhpDrSiLDn65abZR00
   2CBsuYp6EZAqcuEYq3YXao2LYEdUES6qJrtnGusTSl1Fk++JDI4UthCN8
   Oi/bobPgkHUeCKQEf45S0ACZlYjAvelF1K7hHJ0RFJWOMy1Tl8ZXvz9/E
   uN9fbVFarkQlbqhMeLPltlrlUz6fSjajc+kmcXZlveSTI3gsRRiscYJYD
   Q/avbCVojET09QXlrf5OQlvu0s3m9lUERan+BUrJ05z9BnV9QZOWCUMqb
   2kDzXAkEHWqDqdWRdRbCkv5e92BW1/F+aF3Nul1O4E8qVjuC55CCP0g9d
   Q==;
X-CSE-ConnectionGUID: SiTb9ouSQJOgLPfk75PUJw==
X-CSE-MsgGUID: Aj/8CggxTmiUQQBVugqc3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="73004804"
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; 
   d="scan'208";a="73004804"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 05:55:45 -0800
X-CSE-ConnectionGUID: pOBY9FZxQbyCZGS/wiG3wg==
X-CSE-MsgGUID: q8KfIWj8QU+GcGol/IjKww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; 
   d="scan'208";a="223376924"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa005.fm.intel.com with ESMTP; 05 Mar 2026 05:55:43 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 8E5DA95; Thu, 05 Mar 2026 14:55:42 +0100 (CET)
Date: Thu, 5 Mar 2026 14:55:42 +0100
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Michael Tretter <m.tretter@pengutronix.de>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	linux-leds@vger.kernel.org, kernel@pengutronix.de,
	Thorsten Schmelzer <tschmelzer@topcon.com>
Subject: Re: [PATCH] leds: led-class: detect brightness conversion base from
 string
Message-ID: <aamLXuyzEiqJGDtu@black.igk.intel.com>
References: <20260123-leds-class-convert-brightness-value-v1-1-ae9d3ae4224b@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260123-leds-class-convert-brightness-value-v1-1-ae9d3ae4224b@pengutronix.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Jan 23, 2026 at 10:57:26AM +0100, Michael Tretter wrote:
> From: Thorsten Schmelzer <tschmelzer@topcon.com>
> 
> sysfs-class-led doesn't specify the number format for the brightness,
> but the class only accepts base 10 numbers.
> 
> Use the automatic base detection of kstrtoul and accept the brightness
> as hex value as well.

This obviously brings a regression.
Previously the 000000000000100 is 100, now it's 64.

While I don't care much (I even like the change), I have to point this out.

The correct fix is to update documentation.

-- 
With Best Regards,
Andy Shevchenko


