Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 145B0355F3D;
	Tue, 10 Mar 2026 19:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773170590; cv=none; b=nrA998XV+yGlkYQOgfDTTrwF7qSQX0SB+pOZQRhe4rElGNjIPPD8C9Tnh3wjZsVwXT/NfDkr3T8wc1iNySG5RmGatD48xAOxYXcujBKOJ0FpkayuTV2Gjon8W5ORaJ025pLBjHZNEi7KDIcqHyMIKTkm/63zuWjhisJ15fI6nKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773170590; c=relaxed/simple;
	bh=bRn5Izg5z0uAPXx0Zw671fqZIQditRDKRj46WiT7/50=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bi6OXD5XQBZh9EFbKz4A2wsEulbErMNkoByVzpTfuEut/LdAvrwCUK69cxjHoqHVP7xy+anvMo2eL0XZ7AsumuFYva4HEkL6lgD5uIkHE1imS5iWaOvrYUaxl17FhVqGkrBCOP7tw4ubRJwuqFaj9nPgKTqRH4n8cdHLoC1U5FM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=IGrKMrCA; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="IGrKMrCA"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=RliMOQhbaEtUbn5MyitB9jjdBH2gZPVRZsCQWnu9BWo=; b=IGrKMrCAUbd0d793yXA8vF5u+W
	4urMx/x/I3e96iHyAf8kVWBzTy0rA3114wtXjhK076hlpPdSJMLdnB6Qj9t2pdJN/ZqOIYJMj7CkH
	O7Ya9LwZBawWjGUYYMba+p3d2RqbZLzJKI7yGddteY1btZBOYuG7JwwrH/SfT2HZ0OOk=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1w02fR-00B4iy-EM; Tue, 10 Mar 2026 20:22:57 +0100
Date: Tue, 10 Mar 2026 20:22:57 +0100
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
Message-ID: <500dfc4b-ebd7-4637-bed0-130fc571923c@lunn.ch>
References: <20260227190617.271388-1-i@rong.moe>
 <20260227190617.271388-2-i@rong.moe>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260227190617.271388-2-i@rong.moe>

On Sat, Feb 28, 2026 at 03:05:58AM +0800, Rong Zhang wrote:
> In the following patches, we are about to support hardware initiated
> trigger transitions to/from the device's hw control trigger. In case
> the LED hardware switches itself to hw control mode, hw control trigger
> must be loaded before so that the transition can be processed.

This sounds backwards around.

A Linux LED starts out life as a dumb LED. You can set its brightness
using /sys/class/leds/<foo>/brightness.

Userspace policy can then give additional meaning to the LED. It could
blink a heartbeat, disk activity, show rf-kill status, activity on a
serial port, what link speed eth42 has etc. The general design in
Linux is that any LED can be used for any of these functions. You
decide what an LED should indicate by selecting the trigger for it. To
be able to select the trigger, the trigger needs to be already loaded.

Only once you have the trigger load, and the LED using the trigger,
then you can think about can the trigger be offloaded to hardware.

In linux, policy is in user space. If policy says led X is to be used
with trigger Y, user space can get the needed trigger module loaded.

     Andrew
