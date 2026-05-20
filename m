Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EF9F3603EC;
	Wed, 20 May 2026 20:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779308184; cv=none; b=G9Onh7KqVEREMYrpUjcPH9bL8Vtv9Li6Wi+g7YTIZtnmj9SV03ROPpPWdg8bsxLAJdFAqj37wmTN0Bo+FniiGiI2vidkU+4M32LK7NqMY5a6jf5dEAnu7VV2lmlO3kD8lSdzpxgk0IjlAG2AebaX7/UPk9sE3DmEPwG7WLOs+94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779308184; c=relaxed/simple;
	bh=XcoUdVXXk9URy0a89lMw7LE44bzRC6QD7yq7nf3RR0w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O5dnlw4u2Cu8rNTz+mmrBxgy0TofElQPJxBW1wYMttLxZGdDdX/XR1oCLRYDtniGeoAWABAKvsoWuZqg+hCCIBLc4LFsPI1Mu/MWXD07fGmvqlj43qSGI3mpqaAoghasBTGPd7o1k3AfT/r0BTDvyCHWnggBNvUvNANCUJmxgck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=zGH4PtPv; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="zGH4PtPv"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=38JBtJBcatHkCcmT2MXlQ7/2j8bZJT8wvXs8WgGCPbA=; b=zGH4PtPv3/MVNdbkDkcvqyqImL
	cgkgztGydWB8KNyQDLYIUjfbWiqUwctzEnLzZ2YllPv90K1+RvbUQoKpE0chgKVDS4HII1zKyCQWR
	g5DDCBkesDaMlH6ORKXt29ulrg9Egpgotv+aAeVwd/rta0KC+Kooh0WMf5hBq7H4Wso8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wPnKk-003tld-ER; Wed, 20 May 2026 22:16:02 +0200
Date: Wed, 20 May 2026 22:16:02 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: mike.marciniszyn@gmail.com
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
Subject: Re: [PATCH net-next 1/3] leds: trigger: netdev: Extend speeds up to
 100G
Message-ID: <d2faba3d-68ed-492f-a914-d513e9f8b34f@lunn.ch>
References: <20260520200337.204431-1-mike.marciniszyn@gmail.com>
 <20260520200337.204431-2-mike.marciniszyn@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260520200337.204431-2-mike.marciniszyn@gmail.com>

On Wed, May 20, 2026 at 04:03:35PM -0400, mike.marciniszyn@gmail.com wrote:
> From: "Mike Marciniszyn (Meta)" <mike.marciniszyn@gmail.com>
> 
> Add 25G, 40G, 50G, and 100G as available speeds to the netdev LED trigger.
> 
> Signed-off-by: Mike Marciniszyn (Meta) <mike.marciniszyn@gmail.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
