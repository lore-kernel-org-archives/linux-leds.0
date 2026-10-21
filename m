Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792564725;
	b=NB709c5L+NhuuBIyfhanB1FILuAMjhLfpT5NPJCoYsKo4L6TPApzOOfDU9PcGRIxcKwP
	 jRODStcCP8QezCHqAWDRZR83TdyhdVHENyY1JGUGZnBEiSvxsPAX5rpEjJKB59TcrHNad
	 NZdiTGwmT8AEKRQATTuQdrFVg+ReAVFcaFBRrXC4Sup5XcAFDQfx+yUFySW2K0qLnO1OV
	 6iv5o/mjxCYuPH9OpBELtw4lfx/lcXeOSdMU+Yshg7B7uDwcYkwazOlOSvdGSng7QSAuC
	 29V7UOnsTk52Gir4dM9+HsE3T5A/ozUy6zAhHY26OWrsSH3XPqYWEGgw4+GMskM89bg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792564725;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=ZG+JNpgq8xf6/8phq+LlPLZvg6PgeNlHrr4kZ8JT0rA=;
	b=puGarhtqhLgXr1InLsQKkWhQvb6bMso1MyBb6D5LRqjN08tEQBSadww3GRTnIGPkv5Vl
	 b6JTrmKIMsaUa1mTq3bczOgGNRF+7F24s7CKKow8tGm1sTN3kLthWaRWfxcbEl/73lWoL
	 m30xxOePVIEys1SlGx1e8MyWLqYDUdXV6DeHejIFT0JTcxdGHLEAFbIcsaNQHuZ7NY2Pj
	 Eql/YYe/Hrfhgfib70TJqJ75FUt57ZW4ntcGIypY/xF0dHYNON/G2qJj/x1xyjImymofP
	 BN/hTbEFTfiTrwNhjN10Sr1U4PZ4Xz+62KLOJ0+bJIRf21y2nD2u6Qn00vV3keP834A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=itwSQO6k;
	arc=none smtp.remote-ip=198.175.65.12
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EA4F606A319;
	Wed, 21 Oct 2026 06:38:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6EA4F606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=itwSQO6k
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792564725; x=1824100725;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=E6SujCVFOC+/QzOXkD/kxTkiNpkEgQajo4+U5CSVmL0=;
  b=itwSQO6kMxHUwcsk42oQvdGGTK6+UkkTXr4VgvUNHueGuJ+U7GVt8+jE
   Vr+B7c05zhBk/VBaqrk/ykzxeyZgCxTCszb+sIYUTWQ1rjLfcjpEjv15R
   EJrBwsWueXaDy4KkXz8uBknDhS0TBSW2Z4sEAHTNmhrgNtIzDRd0hIpj7
   zrjwtKhCLhrTr/FY0M0s3HsDFKiykqxHphn6X9iLpOYApIxu2eziNlIFC
   NHD3dz+4Z6tnPn1Skw04AY52O7mF0dDu96cxTs8CLL4DimTsmkoLaWoXz
   q63w2WXz6It4HdePqMobb5Nkz9ixbPtHNM2ZrvJVwv2wwN3sk5hl8omiY
   A==;
X-CSE-ConnectionGUID: QpxtaETBR/uPozr2Xu6geQ==
X-CSE-MsgGUID: V7FyBd6+SJGoN/A3oL5mZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11941"; a="1160251"
X-IronPort-AV: E=Sophos;i="6.27,169,1787036400"; 
   d="scan'208";a="1160251"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2026 23:38:45 -0700
X-CSE-ConnectionGUID: LWLu7o7ATsKhTPs3B7W0AQ==
X-CSE-MsgGUID: 3ULkdz0lS5m7GlFDvFsZfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,169,1787036400"; 
   d="scan'208";a="3358248"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.24])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2026 23:38:42 -0700
Date: Wed, 21 Oct 2026 09:38:39 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Lee Jones <lee@kernel.org>, Rillian Grant <rillian.grant@gmail.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ruslan Koreev <koreev.r@gmail.com>, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/4] leds: flash: lm3643: Describe the LED of ACPI
 boards without LED nodes
Message-ID: <athd74yu2qng04Tc@ashevche-desk.local>
References: <20261011191026.149338-1-rillian.grant@gmail.com>
 <20261011191026.149338-4-rillian.grant@gmail.com>
 <179198404917.839288.1364319566324835013@kernel.org>
 <atdOUv937j63NKAL@kekkonen.localdomain>
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
In-Reply-To: <atdOUv937j63NKAL@kekkonen.localdomain>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Oct 20, 2026 at 02:19:46PM +0300, Sakari Ailus wrote:
> On Tue, Oct 20, 2026 at 11:45:06AM +0100, Lee Jones wrote:

...

> > Andy, et al.,
> > 
> > I don't usually allow data from other registration mechanisms to be
> > passed through another (MFD data via OF for instance).
> > 
> > Is this okay?

Seconding Sakari's answer, this doesn't sound like the best approach.

> In this case the ipu-bridge needs to provide the information to the lm3643
> driver via software nodes, as it already does for a number of other
> devices. There's no point in putting the information to the LED driver.
> 
> Presumably the ACPI device node already exists so this should be
> straightforward. What's also missing from the sensor then is the flash-leds
> property, the lens-focus handling serves as an example.

+1 to all the above.

-- 
With Best Regards,
Andy Shevchenko


