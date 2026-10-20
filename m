Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792495193;
	b=nXnz7gl8ou0mIpZAUXJzXb6itx/EFbweHvnOdpU/lPkO7tjkX+H94AC8tiAxmVSeo8na
	 WTlmkC/DXD6RGFhS5AHJiKnvjDsUQsrQ0F9pUnrGVqfuyZCI4owmJbxMfISU5Im7F2bYd
	 uPCT3Pz7prYfl8oCvKSUyXjdN6ei5gzrqccic0s8OgAg4/jngu31/x+tj5qBAuPbG81ed
	 vRf/WBOi+qWFPCtsaM7BLAbThnN4njMB+jOL+mP9F51+/04feB8PW7nfrAFXHhPFtK4NN
	 ZsDvZPY2KFOieZxyldRvI0Of+z5olsOob6OiN3OI/HCfr3FUorCa54OyviMqLzR6oYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792495193;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:
	 Organization:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=AMia+D58A/8/Yr2fbaI0Wg1o6qEQxkVnI4avM+pRLeM=;
	b=Wp8dIi16tBNDe4sNsH9fvOQZpoH+YK1vn/w0Tjdtxn9m+Sie7Yp7QL/pi94Kj5iMNGeQ
	 hHwNc8SjXsx7IQKAbcPAM3C4o7V/HmQeF8dISOnADGv/LboE4eS/Wh9bjUDi2Of5K4abg
	 +VkkqvbHFg28WbleCVw4mqm8iC3Mtb813pOiUA/s6QzvMcbUy0i8xKl/otIhSj+r5+6fa
	 n43S3Y3a5gUuFXYSx/RyQc9gIoP5Pxl9iLSbLcT+hnKlSkiUtNMXwEtgvmkAL3kS0+8sU
	 afb4KWeaZpbRj1Tpf71EhmTe/WkOJU2DaPiJC1graabcd/D4ifMupamLsAqSZJUhZPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=f3kKcYK4;
	arc=none smtp.remote-ip=192.198.163.12
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8D45606A32D;
	Tue, 20 Oct 2026 11:19:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8D45606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=f3kKcYK4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792495193; x=1824031193;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KEOSegekDMJf6c6yUunYimqfLWSZKBnvoz61oRPNdjs=;
  b=f3kKcYK4gsxs72h70SGSq3wSZqA3AIt5XAhgRil3X4JTriTPcwc63VpD
   hphswtKSWqp1uklHKYiGxViQ4noNobAN0EJjHV1O/w4OieNWCpoGp61lY
   SlqzkrHABsfAGsJ2a8yeApaOA5O/qDKFBOGdav8PexCUTJJvIuog2ZLaW
   hrIuzxARs2NkF9QBbeZgjj5YJRWUAerit59TINYmwQkiRk0XO0NU4flis
   HscnjafLXqaJdq4jv3cAQUvwx2V2+wufVUNihIUJNActZ5PjveM145Axh
   fx2h8/K/5xPL5rhomIvZTEWSFQY4DOqFFdT6Ied9qHjOV5xIkNuymKdkj
   Q==;
X-CSE-ConnectionGUID: jBRG6DzSSjmqHetBXCDD3A==
X-CSE-MsgGUID: vYQIyqxgQc6eo+PJAcarEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1097968"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1097968"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2026 04:19:52 -0700
X-CSE-ConnectionGUID: fw2LKXyeTouVwBipAlpsuQ==
X-CSE-MsgGUID: 9z4uI4HZS/CbFZ/iyxTLdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="2748263"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.132])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2026 04:19:49 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 1D6FE11F7E8;
	Tue, 20 Oct 2026 14:19:46 +0300 (EEST)
Date: Tue, 20 Oct 2026 14:19:46 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Lee Jones <lee@kernel.org>
Cc: Rillian Grant <rillian.grant@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
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
Message-ID: <atdOUv937j63NKAL@kekkonen.localdomain>
References: <20261011191026.149338-1-rillian.grant@gmail.com>
 <20261011191026.149338-4-rillian.grant@gmail.com>
 <179198404917.839288.1364319566324835013@kernel.org>
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
In-Reply-To: <179198404917.839288.1364319566324835013@kernel.org>

Hi Lee, others,

On Tue, Oct 20, 2026 at 11:45:06AM +0100, Lee Jones wrote:
> > @@ -691,6 +692,92 @@ static int lm3643_register_led(struct device *dev, struct lm3643 *chip,
> >  	return lm3643_register_v4l2(dev, led, fwnode);
> >  }
> >
> > +/*
> > + * Lenovo ThinkPads enumerate the chip through ACPI (HID TXNW3643) without a
> > + * _DSD, so the LED is not described by firmware. On the boards below it drives
> > + * the Windows Hello IR flood illuminator, with both current sources feeding a
> > + * single LED. Describe that with a software node, with torch and flash limits
> > + * (100 mA and 300 mA per output) well below the chip's maximums.
> > + */
> > +static const u32 lm3643_ir_flood_sources[] = { 0, 1 };
> > +
> > +static const struct property_entry lm3643_ir_flood_props[] = {
> > +	PROPERTY_ENTRY_U32("reg", 0),
> > +	PROPERTY_ENTRY_U32_ARRAY("led-sources", lm3643_ir_flood_sources),
> > +	PROPERTY_ENTRY_STRING("function", LED_FUNCTION_FLASH),
> > +	PROPERTY_ENTRY_U32("color", LED_COLOR_ID_IR),
> > +	PROPERTY_ENTRY_U32("led-max-microamp", 200000),
> > +	PROPERTY_ENTRY_U32("flash-max-microamp", 600000),
> > +	PROPERTY_ENTRY_U32("flash-max-timeout-us", 100000),
> > +	{ }
> > +};
> > +
> > +static const struct software_node lm3643_ir_flood_root = {
> > +	.name = "lm3643",
> > +};
> > +
> > +static const struct software_node lm3643_ir_flood_led = {
> > +	.name = "led-0",
> > +	.parent = &lm3643_ir_flood_root,
> > +	.properties = lm3643_ir_flood_props,
> > +};
> > +
> > +static const struct software_node *lm3643_ir_flood_nodes[] = {
> > +	&lm3643_ir_flood_root,
> > +	&lm3643_ir_flood_led,
> > +	NULL
> > +};
> > +
> > +static const struct dmi_system_id lm3643_dmi_leds[] = {
> > +	{
> > +		/* Lenovo ThinkPad X1 Carbon Gen 14 */
> > +		.matches = {
> > +			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> > +			DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "ThinkPad X1 Carbon Gen 14"),
> > +		},
> > +		.driver_data = (void *)lm3643_ir_flood_nodes,
> 
> Andy, et al.,
> 
> I don't usually allow data from other registration mechanisms to be
> passed through another (MFD data via OF for instance).
> 
> Is this okay?

In this case the ipu-bridge needs to provide the information to the lm3643
driver via software nodes, as it already does for a number of other
devices. There's no point in putting the information to the LED driver.

Presumably the ACPI device node already exists so this should be
straightforward. What's also missing from the sensor then is the flash-leds
property, the lens-focus handling serves as an example.

-- 
Regards,

Sakari Ailus
