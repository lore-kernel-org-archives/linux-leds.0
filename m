Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F46E2D3A75;
	Thu, 21 May 2026 14:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779373719; cv=none; b=J53KCe671tMuxeW+dn+mt6A927q1Q6tyvREq3iHSW+pFTZpSQ+alpv/A9WKxOtaIXyQkPBSNZB3CfiLiqdzB6ifbRQYmPktqHSzZzmfHYkX9B9M6R8/7dXwoJiBTqsEvZyUojub5rcS5J94xVWQ+yBwwdfuZGBbBjmGJs7fFfIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779373719; c=relaxed/simple;
	bh=9OnuhGTSQF2OJ48K0X20dl4cdVwfQMnZ6hyw7gclXrM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nbtW9qufdc0Hx48iZj09TedbuEYcBq9zEOFz/YTosiTZ9XWNqjC3r6NSRnDS7PV6oXy/3BOnPnaglDfyBEaeAm5yzA/DJCiIjBna0+ww5YUFSyazHBITxPqVgXkWSfph9q3huydydNNO6DJUvb2A8vVRd66fn2MyGljjpbxfRcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=jzeTJega; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="jzeTJega"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=8CXFydHNskVWlzzBWBJrcB027hkAoAP6bN4d93LcMxo=; b=jzeTJegaeGIU16EJhX49M4hFDF
	CJIRtoG7nP5Z4W6T9TdAGlWZ1wgKBmKmexI85XVn7cd+qNWEOv/iXUrtC7o0ucDSyl5XupAg1Z69N
	7LyB3WVtcwbKah+SD1mzjFaJyrt/Iil/U11NRsOtApitCzAGaijGILimyK3QkqUvQoU0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wQ4Nd-0042K3-Mi; Thu, 21 May 2026 16:28:09 +0200
Date: Thu, 21 May 2026 16:28:09 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Mike Marciniszyn <mike.marciniszyn@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Alexander Duyck <alexanderduyck@fb.com>,
	Jakub Kicinski <kuba@kernel.org>, kernel-team@meta.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	Daniel Golle <daniel@makrotopia.org>, Kees Cook <kees@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Dimitri Daskalakis <dimitri.daskalakis1@gmail.com>,
	Jacob Keller <jacob.e.keller@intel.com>, Lee Trager <lee@trager.us>,
	Mohsin Bashir <mohsin.bashr@gmail.com>,
	Alok Tiwari <alok.a.tiwari@oracle.com>,
	Chengfeng Ye <dg573847474@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
	netdev@vger.kernel.org
Subject: Re: [PATCH net-next 0/3] dd LED support for fbnic
Message-ID: <ba27c1dd-e079-46bd-a0f5-d8aeb4e1a605@lunn.ch>
References: <20260520200337.204431-1-mike.marciniszyn@gmail.com>
 <48c64757-dc3c-4d05-a269-fa4f50c299c3@lunn.ch>
 <ag8S8p-znkBc2WTP@PF5YBGDS.localdomain>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ag8S8p-znkBc2WTP@PF5YBGDS.localdomain>

> Correcting the subject I think would mess up subsequent revisions unless
> I retract the series

Revisions are pretty much considered independent of each other.

You can include a link in v2 pointing to v1, if want to make it easier
to go backwards.

   Andrew
