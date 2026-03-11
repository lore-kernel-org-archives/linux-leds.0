Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BC213033EA;
	Wed, 11 Mar 2026 21:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773264596; cv=none; b=PfchkBdf5VDilzAcPkO0TzV3HVU8F//pAtoOP1RKbliLWSMDEoJ88nPaUCtJ76aoUzKtlB07bpHfZq2vRRqZaeViZh/oKhG1QaPUHZHSQ9Cnox89xRsBgrfevXOyoi7DZ7361bS9XgaHMYuqZ2EwyZHXlrX4flmlejYIoQtN3eI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773264596; c=relaxed/simple;
	bh=HD0xJllVkqXn/71yAFFtvcZVXN78R7HnDNT9VY/ptqM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V1SOSRXLlaWVdu4aXxUiSx2Tn4YakUYUDGzGMee8UqIpl5UHV5FfjIqdnYgjCn7KDqEjIU+D+v9K8z24sMjXd1erKAdebmh9Lu/SyMuPE0qIWAbr+3ZZPe8G/P9jG59Vl1SqnCiS+NCz5GQA1lGbHwRzMjujhH+ecXRKjVaJTFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=Ke2tTmV2; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="Ke2tTmV2"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=yE8PA9EcFriWt9TpAr9J/ek83J7cYO/n97BBtHDCGhs=; b=Ke2tTmV2tMcJ1wJKsiNiJWkSDI
	gLel5vD3arZlnq0hQ6d7SnkzvSFE4mROVuarAAb4OBOu7joKBYy0tv1k4ilc8VH7aogGuUu0QwQnR
	6+7SUbcYhaqbyZVuBwyIoRj2OptfMwq07DNchj0st2l5s1r3RY4sAT0aQ+ia1A3Ingso=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1w0R7b-00BEgs-79; Wed, 11 Mar 2026 22:29:39 +0100
Date: Wed, 11 Mar 2026 22:29:39 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Rong Zhang <i@rong.moe>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Ike Panhc <ikepanhc@gmail.com>, Vishnu Sankar <vishnuocv@gmail.com>,
	vsankar@lenovo.com, linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org, chrome-platform@lists.linux.dev,
	platform-driver-x86@vger.kernel.org
Subject: Re: [RFC PATCH 1/9] leds: Load trigger modules on-demand if used as
 hw control trigger
Message-ID: <60e60c42-f776-424a-a5b4-7286d33175d1@lunn.ch>
References: <20260227190617.271388-1-i@rong.moe>
 <20260227190617.271388-2-i@rong.moe>
 <500dfc4b-ebd7-4637-bed0-130fc571923c@lunn.ch>
 <b48993998e6e48d4448f8c6dc758f4e260d0f857.camel@rong.moe>
 <353713de-b121-4e27-a46f-6ca1941888a6@lunn.ch>
 <8b25e1ea9bff414442fa47475b9c9ac5b29049d7.camel@rong.moe>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8b25e1ea9bff414442fa47475b9c9ac5b29049d7.camel@rong.moe>

> We just can't prevent the EC from responding to the Fn+Space shortcut.
> So it's essentially user's choice to switch to the hw control trigger
> and make it offloaded to hardware (sorry if my cover letter and replies
> didn't express this well).

Do you have any control over the EC?

You have a two bosses dilemma. You need to eliminate one of the
bosses. Either the EC controls the LED, or Linux does. Having both
controlling it is just going to work out badly.

> As my previous reply said, it's common that an LED driver can't prevent
> hardware from changing its state autonomously. Prior to the
> introduction of auto brightness mode, brightness_hw_changed is enough
> to handle this. The issue only emerges when recent models start to
> provide an auto brightness mode based on the ALS sensor.

Do you have a software driven brightness mode based on an ALS? What
API do you use to control this? Can you use that API, and accelerate
it?

> FYI, desktop environments (e.g., GNOME, KDE) can control the backlight
> brightness of keyboards through sliders and heavily depend on
> brightness_hw_changed to update the sliders and display OSD once the
> shortcut is pressed.

Hold up. Terminology problem. I'm a networking guy, i know networking
terms. By slider, do you mean a software scroll bar sort of thing? I'm
an XFCE users. I can control the display backlight with a slider on
the battery charge applet. And i can use Fn F4/F5. I've not seen a
software scroll bar for the keyboard backlight, but i think
<CTRL><SPC> allows me to change the keyboard backlight.

So we have a slider, which is purely software, Linux. And we have key
presses, which you are calling shortcut, which the EC acts on, and
might tell Linux, maybe, but not about the key press, but the action
the EC took because of the key press.

You have some API to the EC to ask it nicely to act on the software
slide, but it is the EC which really controls the LED, not Linux.

To me a Linux LED is a poor fit for what you want, and i think a
trigger is even worse. The problems you have are because the
LED+trigger model, plus using the hardware for acceleration, does not
fit with the EC actually controlling the hardware.

I would suggest you look at the API the EC exports and find a better
model for it.

	Andrew
