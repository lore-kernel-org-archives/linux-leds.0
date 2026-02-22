Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DF7078F26;
	Sun, 22 Feb 2026 15:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771773500; cv=none; b=YLGL0GG2e+u8HDBKbm+Q15xe/HNdqsISdFDHhF6IJzFflB10KXoJceJ9RclzfVE612Mk1dzg5OTNNLJ7F6d8o/CxxHrqvZAUrHjaWgoSfoFtP6/EFxGIiS4CFchDhHXkjUppCffYQdlXCMzWgWDEc6BBFZJnZVmXzZYqox52z6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771773500; c=relaxed/simple;
	bh=2y5d/Bf5e9BEtbiAfPqtVfDwMU+WXaxd/jOmJ82inlY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J/hH/JnbD1BTgATSkBwv1FYswhrU3cYC48GR8Lr8YWUwyDSdOfCUfw5j6quHT+ZKxbHM1EpQcR3lEKFTCSRnyScOpsHHqNGff/S5Vtml3IEgUf9ccoY2ljaWg0cmq8VP/A69DxG8RN1WMm7uO+fRhoDNvaTvOyChhEdOhG3/r9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=29miffq7; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="29miffq7"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=ms9fqXqBFGh8yg9aTsPRKP1U58T3HV5wRi+ksAALCOs=; b=29miffq7FfUbHB/uzHHT3mc8JL
	Ezf/jHnFEAa5cF2ZK3pYMMU8hS43bqNA6rmuNC1DZbs6+eksrD8IXb0EdlnsHf+Vk8emw5PQT3ySM
	pdmydESFP7nrT/Ah9f1u1wXsTCJj4f+ovjlqqVOHgR+Cn/IWntHoaEGa6AoImxW+erEs=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vuBDp-008IhS-Pr; Sun, 22 Feb 2026 16:18:13 +0100
Date: Sun, 22 Feb 2026 16:18:13 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Shiji Yang <yangshiji66@outlook.com>
Cc: davem@davemloft.net, edumazet@google.com, horms@kernel.org,
	kuba@kernel.org, lee@kernel.org, linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org, netdev@vger.kernel.org,
	pabeni@redhat.com, pavel@kernel.org
Subject: Re: [BUG] AB-BA deadlock between net and led-trigger module
Message-ID: <39823b1a-5848-421b-84c8-ffb628cf2ae8@lunn.ch>
References: <a592f471-fe5d-47c0-a5f6-305fbdcf686f@lunn.ch>
 <OS7PR01MB13602E8AA4E5ADE00E7441B6CBC76A@OS7PR01MB13602.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <OS7PR01MB13602E8AA4E5ADE00E7441B6CBC76A@OS7PR01MB13602.jpnprd01.prod.outlook.com>

> I backported this patch to the 6.12 kernel and it did actually
> fix the deadlock issue for me. And the phy triggers are still
> working properly. Thanks for your quick fix. Nice work!

Great. I will post it officially, and it would be good if you can add
a Tested-by: for it.

https://docs.kernel.org/process/submitting-patches.html#using-reported-by-tested-by-reviewed-by-suggested-by-and-fixes

	Andrew
