Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBC033A6B85
	for <linux-leds@vger.kernel.org>; Mon, 13 Jul 2026 08:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783932140; cv=none; b=U/uPo6WEUiHBG6Jldzma9PNTkzfqftATdkqAc3KsUeWWRLbb9Y70J8Sg7Uhkv3FLE8Ca65H6qlb+7+5Tf3pgNHT+TxfjG6VfuEybfvt4UK8GVUq0+KZJLiI6Lt42INNyYzj7YKXiKnkOtAacagHXIM8+5zLKB7tqoVZbVqfZY6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783932140; c=relaxed/simple;
	bh=iUDOqrS1SfXhnmjOch/KXQRf9K58QT6PFEtWmcxLoMY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h/i4E6vYfoIDSW9nDnId34Cp79A/ulDHzt9+1OgOvH3fjl2SRNIkwBNRj7bf4T+g70aJ0aI8NG5ZfwYWC2AYtquz+JDviAntQ0OT2eYWiSbhc7SHrboF890KhWet9ESag+h7FPZgamXRdmrGa77DXcEqMpLeg7FKk9uZmgzpmUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <jre@pengutronix.de>)
	id 1wjCEc-0001XR-9d; Mon, 13 Jul 2026 10:41:54 +0200
Message-ID: <0e3f38bd-ca70-4136-a313-564267cb9239@pengutronix.de>
Date: Mon, 13 Jul 2026 10:41:53 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 1/2] dt-bindings: leds-group-multicolor: Introduce
 default-intensity
To: Stefan Wahren <wahrenst@gmx.net>, Conor Dooley <conor@kernel.org>,
 Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Jean-Jacques Hiblot <jjhiblot@traphandler.com>, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20260708224652.106632-1-wahrenst@gmx.net>
 <20260708224652.106632-2-wahrenst@gmx.net>
 <20260709-outsell-undamaged-6c8045d6115f@spud>
 <cacecf1f-3074-4768-825b-bf143fd36ce2@gmx.net>
From: Jonas Rebmann <jre@pengutronix.de>
Content-Language: en-US
In-Reply-To: <cacecf1f-3074-4768-825b-bf143fd36ce2@gmx.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: jre@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-leds@vger.kernel.org

Hi Stefan,

Thanks, for CCing me here.

On 2026-07-13 10:23, Stefan Wahren wrote:
> sorry, I missed this. Thanks for pointing to this patch. In general i'm
> fine with this approach, but there is something which confuses me.
> Looking at the description, there is the statement: [default-intensity]
> "Defaults to 0".
> This seems to be correct for the Linux implementation of
> leds-pwm-multicolor, but is this really an expectation along all (multi
> color) LEDs (at least for Linux)?

You are right, sadly the initialization default of some
multicolor-LED drivers differs.

> E.g. leds-group-multicolor init the intensity with the maximum. So all
> users of leds-group-multicolor should specify default-intensity for each
> sub LED to achieve a defined behavior without breaking existing behavior.

I agree, once support is added to one of the drivers that doesn't
zero-initialize, the documentation needs updating (because as you say,
backwards-compatibilty probably beats consistency here).

I'm also just noticing that my v3 for only the dt-bindings never arrived
on the list (I think I was on a buggy b4 master), I'll re-send now.

Regards,
Jonas

-- 
Pengutronix e.K.                           | Jonas Rebmann               |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-9    |
