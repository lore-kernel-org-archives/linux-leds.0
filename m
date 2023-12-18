Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1F9412B9D;
	Mon, 18 Dec 2023 09:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="uR6xd55q"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=fMKaYER4HHEEPcoTB7NnUNSrSSLoCHuDty7qTHLn6Vw=; b=uR6xd55qq1RNW7InS6yl5oMSAH
	9USQ4Bj/1VOfs6fjkX7ZDG4rtzTNKBksToL/4jnMZnjpNIz3IlBneREnsOj7Zco/OS1vjWIwLa1Sz
	s7H3ydTwK5Ark5z3xHppyLyqHd3ScRH6Jp294X5c+xujmZiz80JB+wy9ffDUBBL2yRxQ=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1rFACE-003EH0-8x; Mon, 18 Dec 2023 10:45:58 +0100
Date: Mon, 18 Dec 2023 10:45:58 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
	"linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>
Subject: Re: [PATCH RESUBMIT] leds: trigger: netdev: add core support for hw
 not supporting fallback to LED sw control
Message-ID: <639a6a12-be24-49be-9b0d-43cb3ccf7ee7@lunn.ch>
References: <3fd5184c-3641-4b0b-b59a-f489ec69a6cd@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3fd5184c-3641-4b0b-b59a-f489ec69a6cd@gmail.com>

On Sun, Dec 17, 2023 at 07:46:42PM +0100, Heiner Kallweit wrote:
> If hw doesn't support sw control of the LED and we switch to a mode
> not supported by hw, currently we get lots of errors because neither
> brigthness_set() nor brithness_set_blocking() is set.
> Deal with this by not falling back to sw control, and return
> -EOPNOTSUPP to the user. Note that we still store the new mode.
> This is needed in case an intermediate unsupported mode is necessary
> to switch from one supported mode to another.
> 
> Add a comment explaining how a driver for such hw is supposed to behave.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
