Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D96F818FC97;
	Thu, 11 Jun 2026 14:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781187640; cv=none; b=hB4bE8phstSevKraMwcg2gg1/FBF2MoGcmopP47g4iRFRiIY4LnKf1p8I97WKu6GJFOevd8NJwsqxqibiS+GfRnnpY3ZKxJdoqsqLE9eZ6W/3hB0kMKck70oF6guCfkS4TAkqbJ62zPAyE8FFCtHnoMfwNgLpp+39yNg9HnLPrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781187640; c=relaxed/simple;
	bh=ADQz79wsdx0K9pSTvhRv4OP57hiPtzgG1Gdz9YO0Smk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XSCjOq9hLO7S14XDApyTWpG8PDq0axnj9qoKUfezkZyh577bLOXy9xNxXsvITr7am+PLXQJ2c41XyNkxvHtBqxX6lKc+cms9E6RIX8P155vmfXBTaHVEjTZLv8SY++vWgjPKrbcr9mA0K9W+M841iuOzCXcxEGPmRYatlNGPl+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HvoK8CcD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HvoK8CcD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 428251F00893;
	Thu, 11 Jun 2026 14:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781187639;
	bh=v2gjtL3A5CRGLr5EDM+cgnB3UKQPGTOj7Fa8nWv3OBA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HvoK8CcD/1QEh/SAWVVdiKVHVlLEUy0sEBvE0xhESVAAiWhUMY7rUDoOD6EFWOTZ4
	 sBQt8RtWPJhw3PrpxD7jq13kw+wQ+b62TUcbKqTwQbKGK9rUkPwQq1ePj0cLq5TzIQ
	 fIZG3NNkFvs/0S7+pNFxm22FnFAl7u2YNy+VMhlRGHIOCEt7yt0RkZTC8SCYMV81c6
	 25oWhFQG4H9RXQjXk69vNbF6uH2aaBG/gtLvPQuAPGx/0KIIU00mHEA5yXS24NfHFg
	 6ipWUo4W3o06kYqXWr0gmhVFuw8hMnAqABuwiGEQ46aURJiOxGuc9TEbq7PwOfQ18S
	 S9f8wukwH7A4g==
Date: Thu, 11 Jun 2026 15:20:32 +0100
From: Lee Jones <lee@kernel.org>
To: Andrew Lunn <andrew@lunn.ch>
Cc: mike.marciniszyn@gmail.com, Pavel Machek <pavel@kernel.org>,
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
Message-ID: <20260611142032.GA1127823@google.com>
References: <20260520200337.204431-1-mike.marciniszyn@gmail.com>
 <20260520200337.204431-2-mike.marciniszyn@gmail.com>
 <d2faba3d-68ed-492f-a914-d513e9f8b34f@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d2faba3d-68ed-492f-a914-d513e9f8b34f@lunn.ch>

On Wed, 20 May 2026, Andrew Lunn wrote:

> On Wed, May 20, 2026 at 04:03:35PM -0400, mike.marciniszyn@gmail.com wrote:
> > From: "Mike Marciniszyn (Meta)" <mike.marciniszyn@gmail.com>
> > 
> > Add 25G, 40G, 50G, and 100G as available speeds to the netdev LED trigger.
> > 
> > Signed-off-by: Mike Marciniszyn (Meta) <mike.marciniszyn@gmail.com>
> 
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>

Should I wait until the net reviews are satisfied or take this right away?

-- 
Lee Jones
