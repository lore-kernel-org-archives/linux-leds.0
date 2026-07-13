Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A79E834888F;
	Mon, 13 Jul 2026 20:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783974466; cv=none; b=HLW9weeCka2dFPrpcptc2KuM8zwaP3xfWiExf2DAZzoY2R4/Ilt4R/a+CKkR9Vt/8XTxjivwn6yen57HxkTRkDwjG3RWvtQ1VrxhI4rQfTk9kkPWkMkiHStxi1FUm4Hiuuty1Uhr1eyimoquO1bQh1bYtrDDH1wpVDhyG4Sj1cY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783974466; c=relaxed/simple;
	bh=Ngzkz5tvzhM82Dga29utEzWhgCbugFKT03qJQGOrNoA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GYxngCyji4Bdi5Fp2GLDenEqq/ump9VdbZfJdFNr0KKnOe6XRYJ7B7DtKSYA8aNgr8LsZJZYnITDWiZ+cYHXuu/ZbGqJbDOmSSjngkJJZ9qXa56k3PRZqW2mGc6IPldT8oiBnyduM1YZLBOz986Qncv50hwBdRtUdIKRB+cEX3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=lKZT/mcJ; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="lKZT/mcJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1783974455;
	bh=Ngzkz5tvzhM82Dga29utEzWhgCbugFKT03qJQGOrNoA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lKZT/mcJFEGIzu/eU9wxhcOuc+BQLmuxQrSfLLXpxXrKi/getm2ck64j4oQmMSvoV
	 lqgmwJxubwYsUZaQ22VQAd9krJGNulG8lOHtKof7GfcVpNHH26w3+hNdTrVx9gHzsI
	 Qxdmf4hDe3O7rRvGY2iZSoEdJlCt2ZLQt3sfBCNs=
Date: Mon, 13 Jul 2026 22:27:35 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Rong Zhang <i@rong.moe>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>, Mark Pearson <mpearson-lenovo@squebb.ca>, 
	"Derek J. Clark" <derekjohn.clark@gmail.com>, Hans de Goede <hansg@kernel.org>, 
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, Ike Panhc <ikepanhc@gmail.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, Jakub Kicinski <kuba@kernel.org>, 
	Vishnu Sankar <vishnuocv@gmail.com>, Vishnu Sankar <vsankar@lenovo.com>, linux-leds@vger.kernel.org, 
	netdev@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	chrome-platform@lists.linux.dev, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH RFC v2 1/9] leds: Add callback offloaded() to query the
 state of hardware control trigger
Message-ID: <2b1c347b-6598-4169-8b07-601a8b41faed@t-8ch.de>
References: <20260618-leds-trigger-hw-changed-v2-0-c28c44053cf3@rong.moe>
 <20260618-leds-trigger-hw-changed-v2-1-c28c44053cf3@rong.moe>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260618-leds-trigger-hw-changed-v2-1-c28c44053cf3@rong.moe>

On 2026-06-18 00:47:55+0800, Rong Zhang wrote:
> There are multiple triggers implementing hardware control. However, the
> LED core doesn't really know the hardware control state since the
> coordination is done directly between the trigger and the LED device.
> 
> Add an offloaded() callback so that the LED core can query the hardware
> control state.

For review it would be easier if the code using the new callback was
introduced *before* the driver implementation.

> Signed-off-by: Rong Zhang <i@rong.moe>
> ---
>  Documentation/leds/leds-class.rst | 5 +++++
>  include/linux/leds.h              | 1 +
>  2 files changed, 6 insertions(+)

(...)
