Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79F1E42A7AD;
	Thu,  2 Jul 2026 13:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783000568; cv=none; b=XAkIk3Ro42OOy5fvnOdPABdbVluC07bSg8GYKgLBSZ4zMaTWz5MWX+qZiEC17UMyDOBkv1J0e7nM+l0p1rcLeby6pehwIGvoDI4fXbSWrywLByvWm2Qy7CNW4TryGktmwToODN23QD0M5Annmb9dVNy5GMnoTx9rAYLtU0kzr4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783000568; c=relaxed/simple;
	bh=KMh+d+4YvuIT3L7XAtCuxUSBmLIkaYYGtqOt6pQR0ns=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kUppvT5DSfPxJ0yWYYG1KPze4iIwigUo+v4Hvj4Kw9GYiJli1MjgWCuRlqIYE1EYVw/Qza5jycxxImcMzScTtIYuJ+oIh2kQBL1Wc1E1WyCX9mjueux/DmT1JoUUXwpvoi3WS12BJycS6J/zivLgGD3VcUlfbot3c94dn/fhLEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YWwrJmaq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YWwrJmaq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA1E21F000E9;
	Thu,  2 Jul 2026 13:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783000567;
	bh=PXLihuaPglXVOXzLjkFS0ahzQ9+d8CRPgbnAm3DoXUU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YWwrJmaqp8JTuPi9rZCGCJtU7fohTNeO/qN3gxmOrCuLsaSruKXvz3L7H1bPR112K
	 BqOrnulppYRFnK4VpmfjbRWM1MeS/HF7rYLiuaLqbwkRwmkWGD6h8kIb5PO1z4Zmtf
	 6+p3z7YfvpV0nT/wgkTUuALf+mVDCFL49qfgeTmVwRy7wWU17+4Sx5ljkKVL2hb2wD
	 6nPwwoj0ypIob1TAgia5H0PstyhkYP+WsiMvxWNZWZkMfdNBJJuTqVzqasEjmYo8BH
	 rQ76LtXLEnyXPsC5woK0yMwRQXhjOzwiiRh+tZ5eJAVIwEpyVVMZEoNcjm57DwGdiH
	 5wcAMtuR5u7dA==
Date: Thu, 2 Jul 2026 14:56:03 +0100
From: Lee Jones <lee@kernel.org>
To: Manuel Fombuena <fombuena@outlook.com>
Cc: pavel@kernel.org, vicentiu.galanopulo@remote-tech.co.uk,
	linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/9] leds: st1202: fix multiple bugs in pattern engine
 and brightness handling
Message-ID: <20260702135603.GP2108533@google.com>
References: <GV1PR08MB8497ABC8E6AEFF8AAA1AF883C5E32@GV1PR08MB8497.eurprd08.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <GV1PR08MB8497ABC8E6AEFF8AAA1AF883C5E32@GV1PR08MB8497.eurprd08.prod.outlook.com>

On Thu, 18 Jun 2026, Manuel Fombuena wrote:

> This series fixes several bugs in the LED1202 driver related to hardware
> pattern programming and brightness control. The issues were found during
> testing on a Linksys MX4200v2 router running OpenWrt.

Still a few potential issues highlighted - are they yours?

https://sashiko.dev/#/patchset/GV1PR08MB8497ABC8E6AEFF8AAA1AF883C5E32@GV1PR08MB8497.eurprd08.prod.outlook.com

-- 
Lee Jones
