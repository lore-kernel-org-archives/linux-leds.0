Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 192B1335BA7;
	Tue, 10 Mar 2026 19:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773169478; cv=none; b=t+U5CZvXBqRHuP7iDbrTiTfEQsSlLdiHpkhL9m+V7UFTXqg7lxwRzYJHCzpO0JILwH9jbyg0TZueivabXBP6sRdn7C3iYg8dyPdKKYjctu5mwbbpfrApbf/lfBSBt5DrC1qhvrs4czrR4FlnS6rxb1dVmTxMiYIn4RuFdsbPXqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773169478; c=relaxed/simple;
	bh=MKBMuX6Jgv8j9lnkNN3IB6bN9jJPfRUYsy8+5zPZwc8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZEY3UdRnf0WS8/I1w2DlgXWfExmZkqleLriKtZ63JgjdcIWsCZZGet3yr0o5iL5EAcgOS7soTEP5jGIiMP/2U7QW4GZYFJx2cvqo5hjbA7Jb4R0G1NfPl/OZVuZoLiGkIyypcp5uhI3GGTEbfM1h8DrcyagNl3C76czmjbEc0Wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=21fKxXN7; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="21fKxXN7"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=rdTHQV2OPxzLPKXuuN4Ezq69juPYCD3tIrogYv0rWYA=; b=21fKxXN7DYjhymhDjtNIzZ8clP
	pMa+NyyOqSfkUBGQjvx3eWqC2laOZxuGNGlqtckPH0npfxY/Mw1uMH/8LEwwaMC04iz5v9bbyJmLg
	Z+Pkgtyv2YbxY4zvnNemlBi2LVN9AZFtnO6Leu9zSZZSricosK7HjkDTWyq9zCPeMTS4=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1w02NQ-00B4dZ-NL; Tue, 10 Mar 2026 20:04:20 +0100
Date: Tue, 10 Mar 2026 20:04:20 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Lee Jones <lee@kernel.org>
Cc: Rong Zhang <i@rong.moe>, Andrew Lunn <andrew+netdev@lunn.ch>,
	Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org,
	Pavel Machek <pavel@kernel.org>,
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
Subject: Re: [RFC PATCH 0/9] leds: Add support for hw initiated hw control
 trigger transition
Message-ID: <f3e2e601-ec12-46b4-8986-c2d997e48572@lunn.ch>
References: <20260227190617.271388-1-i@rong.moe>
 <20260310121024.GJ183676@google.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260310121024.GJ183676@google.com>

On Tue, Mar 10, 2026 at 12:10:24PM +0000, Lee Jones wrote:
> I'd like for the netdev folks to take a look at this please.

Before i get the rational of these patches....

Have they been tested with CONFIG_PROVE_LOCKING enabled? My experience
with networking is that it is very easy to get tied up in AB-BA
deadlocks. You need the LED to be as dumb as possible, it is always
logically 'below' the trigger. Having the LED calling up into the
trigger generally gets you into trouble.

	Andrew
