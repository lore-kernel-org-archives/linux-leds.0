Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEF7630C62D;
	Wed,  6 May 2026 06:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778048374; cv=none; b=NQki7C0PT5ySanROQFuNCSeivuJ1bedeL1FCdCCQCz417O3n79oQcQ078uB1UuiENkNtAFk0192awORd2Wx3E1InKimNFUNugqO0LIYF2BBJs69mGyI1vKptVWGPodjzIURTUu/2tWY679n6jUkl3o86KgYi/f2Z1IMggKW4pF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778048374; c=relaxed/simple;
	bh=hvqJbeP9p+DGmQxzChdUPddmFOg9jOAGvwXULn0ZZtQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bVJk2iKg+8NQBaC2bBVaLZ5gSfBh2a8w8IMIrk1Fg6K7wUwdeHB9T1Dx7rNkzCjbU4H6KTFI/ItVJPS9KLSUsvToPxC56pibjEB67gfWCN/wsngvBE09akedWXSaXahLyZBDZbV8Cn05YoaXqAsU+lZG085hQ7qkih5KEsFwlzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=lJFELCGX; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="lJFELCGX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1778048370;
	bh=hvqJbeP9p+DGmQxzChdUPddmFOg9jOAGvwXULn0ZZtQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lJFELCGX2tnCb7XQ6D91OyvhKKho8SSNh/MtHe/NkjVeDbHLNTKJAPJcFPMyY698i
	 ACQ/CSywPxE4pjIU0nD9MsCr5kv9O9wlnTPjUQbdVtF1V/zQxqkTr+lZTy0rRJMs52
	 VlS6OW2VZgMAxVC1O2tWeoNE5iJXDh6xZIIpOjj0=
Date: Wed, 6 May 2026 08:19:30 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	William Zhang <william.zhang@broadcom.com>, Anand Gore <anand.gore@broadcom.com>, 
	Kursad Oney <kursad.oney@broadcom.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, linux-leds@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev
Subject: Re: [PATCH] leds: Move MODULE_DEVICE_TABLE next to the table itself
Message-ID: <357c1670-c8f5-4506-a49a-b9315201d3c3@t-8ch.de>
References: <20260505102846.186219-2-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260505102846.186219-2-krzysztof.kozlowski@oss.qualcomm.com>

On 2026-05-05 12:28:45+0200, Krzysztof Kozlowski wrote:
> By convention MODULE_DEVICE_TABLE() immediately follows the ID table it
> exports, because this is easier to read and verify.  It also makes more
> sense since #ifdef for ACPI or OF could hide both of them.
> 
> Most of the privers already have this correctly placed, so adjust
> the missing ones.  No functional impact.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Acked-by: Thomas Weißschuh <linux@weissschuh.net> # leds-cros_ec.c

> ---
>  drivers/leds/blink/leds-bcm63138.c | 2 +-
>  drivers/leds/leds-cros_ec.c        | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

(...)
