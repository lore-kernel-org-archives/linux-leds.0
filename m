Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B5873B52E9;
	Thu,  6 Aug 2026 14:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786027139; cv=none; b=YGfpchagl0/LUi3GyNfnLHqYMM+8yxuvvoL3Wnhd/1bH6fAEWk4AaLIV5NPAQcUqIRgasd4LC9hnOE99c62gCGXOL+Gre7iZViEZ2GSLyTzSVlD2dPBXtS5uFQnnVZYjgyu2i7H61cvOzjv3lhmd9/iOZo0TQ77HOiQ6WVUUGEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786027139; c=relaxed/simple;
	bh=AVnzm2UP0MZH133pokOudKntrkwnXLdVkzMRzJM3jJs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dYuq6JfDDBXkQXaq82YDZnyd3g6SToTED692HaVt3XvVof1Kjkb7mMBATOCw6yasOUeKRMgFUsitITGLXx96fUIUh+y3gHvmiN/35xxgvzCy/0fvf7SZrcZgkqyHxk6LlWHXvntB1rEEXxC334y+ce4SM4ETp68tC785PUYl2SQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iGrpx9jL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iGrpx9jL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC4851F00AC4;
	Thu,  6 Aug 2026 14:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786027134;
	bh=Di5dM6CoWILnpEDRZeuaoG1A/ywiy77fhMHVIfXM/Bk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iGrpx9jLVKXNIDPNtXRVfxQlGa9iVrzaMmjwF8RePh75nsZ1BtdoanRh82mZ0Hg4G
	 Kr7R6WjKXVUsVUOzP0iEkXpn8W4B9i+JsqjIuzFzJNVpExliuF5B5YCX4NFM9XrnEW
	 Ipw33C65IEzHjXL7CXx0X1vG9mB9mMFNtg0cFGFjrKhbS1L83M9K4vcsr3oxiTreHS
	 10TiYag+N6SbyIBb8cdJPiHOHbzNtatrfs6XPhW8d0FgkMucToAszk/uEiTS92FKqz
	 nKGp7W3/85uAsequcVvD8SPy+k66E/7HmUTVe8pm0bPJaELlPcYoH24xGoak5kMYnZ
	 pVEu+D8v+9KJg==
Date: Thu, 6 Aug 2026 15:38:49 +0100
From: Lee Jones <lee@kernel.org>
To: Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>, Samuel Holland <samuel@sholland.org>,
	linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
	Pavel Machek <pavel@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: (subset) [PATCH 2/4] dt-bindings: vendor-prefixes: Add techvision
Message-ID: <20260806143849.GP2869284@google.com>
References: <20260711192842.845048-3-samuel@sholland.org>
 <178419851981.1265391.16595891427832466278.b4-ty@b4>
 <1954916.R1toDxpfAE@diego>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1954916.R1toDxpfAE@diego>

On Wed, 29 Jul 2026, Heiko Stübner wrote:

> Hi Lee,
> 
> Am Donnerstag, 16. Juli 2026, 12:41:59 Mitteleuropäische Sommerzeit schrieb Lee Jones:
> > On Sat, 11 Jul 2026 14:28:26 -0500, Samuel Holland wrote:
> > > Techvision Intelligent Technology Co., Ltd[1] aka Shenzhen Huiwei
> > > Intelligent Technology Co., Ltd[2] is a manufacturer of single-board
> > > computers.
> > 
> > Applied, thanks!
> > 
> > [2/4] dt-bindings: vendor-prefixes: Add techvision
> >       commit: f0e0417373ca55d07cba596e8afe081c078843ad
> 
> I can't find neither patch1 nor patch2 in neither the LEDs git nor
> linux-next. Is there a git push missing somewhere?

I pushed this a while ago.  Let me know if you still can't find it.

-- 
Lee Jones
