Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14491382F05
	for <linux-leds@vger.kernel.org>; Tue, 10 Mar 2026 16:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773161549; cv=none; b=ON5o6+f9woYU5/n3vYmdWcUlkT6eXHwBeXVMaQuXnO4FBxbGnWY3FQsalJKIvidf9MrB2936bQbeCffwPZP08nunr7NkET3xfoLdl1I65M8PUbpU1+1U6v7C/o2AMMlp++lvkKzY8Hu8wYMIcPlL0RT5BGbqoRL4flveui3Mtws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773161549; c=relaxed/simple;
	bh=AdSOTTfKb9MpWhRjl+zIbTnDN8ukoct/HupO2Co0aic=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l+iY+mKRf2IzT5jvwL4k42q+osITMjyH+LAlNybHmDMQH7VTwfCEdNzsLhXeqGCva8zxa1fPFZfmuUly/k+Dffu8p1+VEQRZQJamY4ogeMv50n1jmNUkIekZoH2B5i5uznwN+MhMCFqBsERZ4OBxB6WvwdhIvdSruwHXol1XnSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F0Sl5iII; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F0Sl5iII"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773161547; x=1804697547;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=AdSOTTfKb9MpWhRjl+zIbTnDN8ukoct/HupO2Co0aic=;
  b=F0Sl5iIIyglbih3Bo4WOpEwnkOXE5k2Km9eRxrfyZP+bTVoXsrMDZokS
   fSm/Cuf8EMhqHZ56NxJDNuP9mnjAXNAXCC3fNey/SYPogWJi/Nd2lXR5N
   1jSXdx7zHyLXkIGLc7DL7N5+3+LxRMbbgZviJZWhsTEfGISJducct8COp
   heBUmBuT7nG8kHKmfuOW1EdRY17Av5SID2EsD2szkPkrKkeJS39Sgenk5
   MgHWa5C5238/mNR2CJGr0dErGQn2qP05LFnvkmqpwH39rhT7KrSr3S13R
   5BrVmCDeAq/uucu3BlqYEC4smVLge+4g0/U+GGt0bDBoN6WCEb/HuxQtI
   w==;
X-CSE-ConnectionGUID: ntpPH/X3St2x0IDFzyfRnw==
X-CSE-MsgGUID: RyneJGVhS6yUr2EI9tKZ4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="85307548"
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; 
   d="scan'208";a="85307548"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 09:52:27 -0700
X-CSE-ConnectionGUID: DkVgL0rCQKycBJIeOxStXQ==
X-CSE-MsgGUID: g0tX0KkQQIWrDe20dzNp6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; 
   d="scan'208";a="258099514"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost) ([10.245.244.54])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 09:52:24 -0700
Date: Tue, 10 Mar 2026 18:52:22 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Lee Jones <lee@kernel.org>
Cc: Michael Tretter <m.tretter@pengutronix.de>,
	Pavel Machek <pavel@kernel.org>, linux-leds@vger.kernel.org,
	kernel@pengutronix.de, Thorsten Schmelzer <tschmelzer@topcon.com>
Subject: Re: [PATCH] leds: led-class: detect brightness conversion base from
 string
Message-ID: <abBMRgH-M7RNjpd6@ashevche-desk.local>
References: <20260123-leds-class-convert-brightness-value-v1-1-ae9d3ae4224b@pengutronix.de>
 <aamLXuyzEiqJGDtu@black.igk.intel.com>
 <20260306113221.GI183676@google.com>
 <aarupkr802-283I9@ashevche-desk.local>
 <20260310092319.GF183676@google.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260310092319.GF183676@google.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Mar 10, 2026 at 09:23:19AM +0000, Lee Jones wrote:
> On Fri, 06 Mar 2026, Andy Shevchenko wrote:
> > On Fri, Mar 06, 2026 at 11:32:21AM +0000, Lee Jones wrote:
> > > On Thu, 05 Mar 2026, Andy Shevchenko wrote:
> > > > On Fri, Jan 23, 2026 at 10:57:26AM +0100, Michael Tretter wrote:

...

> > > > The correct fix is to update documentation.
> > > 
> > > Again, should we remove this patch that you like?
> > 
> > Depends if anybody outside relies on the above mentioned decimal values
> > with leading 0(s). On the safest side is better to drop (and explain in
> > the documentation that the values are decimal).
> 
> For the fear of breaking userspace, I have dropped the patch.
> 
> Please could someone update the docs?

Done in 20260310165143.354065-1-andriy.shevchenko@linux.intel.com.

-- 
With Best Regards,
Andy Shevchenko


