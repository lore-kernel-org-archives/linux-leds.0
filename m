Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67DB23A6F0A;
	Fri, 10 Apr 2026 13:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775827348; cv=none; b=AwcpN6XEwBf7WxTjLdQ6DmTyQlmoB8aYg0iT3FuEsXhNOM86OTIj8LrUgTVYxEV8Y9uSYDQdBsbbaI1iZeL5mkRAqU682i160fQWyCQwE8Jm+an9Fo8zxyuAzz+KElCOpsE/UuKB7X/H7lEwEmWyzwzHhoIxzoeSXSwVvsClhu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775827348; c=relaxed/simple;
	bh=rIHzSU+KRrgJT/YEi5eySAcBR5k3rJgqs0uj87PYaIk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cn38fKx5UmtPn5T66w9qMA4RULhzmAe3zRDJoN9rPEPBE6Hr0ohTRp+zGaDDO2BoSKV3VHdTWAOPNfC4sGIvC1q3GDURL53dNJDQU0t5Vc9u6z72EBMACfaFK/ZpGkOmTI7LhJkdKPb9y5IPd21fZvKsY/I5GHg1w2NcqswRAx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QVP6Lu7y; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QVP6Lu7y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CC77C19425;
	Fri, 10 Apr 2026 13:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775827347;
	bh=rIHzSU+KRrgJT/YEi5eySAcBR5k3rJgqs0uj87PYaIk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QVP6Lu7y9CEuQNcXq5n3LRCZC0r8IK5fEzMaLT7NZhhUrTaUwWtEsBWjMZ4fm4iy2
	 f1XcxHSIsgFOhxnhgHEcxTEMpEGOuLBS4mBgDxX2JPcyOpquWKYcCl27d6MLXggwRl
	 odnBzwbTNjdIU+92mI0k3vYEw3XcPL7ol8RyHF9lUhNWuxaFNU+5umygCWWdcE8pDd
	 FwEGjOJYcR14PlLlGoR4ho9xlfqdwlXuhhCVkGFR6dBL2KMg7XPGpiFQjQyG+Pg9h6
	 jcP0qj/Xqh73GphSvdkwu6DID64Xhsqib0nYB1BIraBj62BlxeBqEcJ9P6pb+9L1Gy
	 tB31U4hF3jUfA==
Date: Fri, 10 Apr 2026 08:22:25 -0500
From: Rob Herring <robh@kernel.org>
To: Corvin =?iso-8859-1?Q?K=F6hne?= <corvin.koehne@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	"open list:LED SUBSYSTEM" <linux-leds@vger.kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	Lee Jones <lee@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Corvin =?iso-8859-1?Q?K=F6hne?= <c.koehne@beckhoff.com>,
	Ashley Towns <mail@ashleytowns.id.au>, Dan Murphy <dmurphy@ti.com>,
	Gergo Koteles <soyer@irl.hu>,
	INAGAKI Hiroshi <musashino.open@gmail.com>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	Olliver Schinagl <oliver@schinagl.nl>, Pavel Machek <pavel@ucw.cz>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
	Roderick Colenbrander <roderick@gaikai.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v2] dt-binding: leds: publish common bindings under dual
 license
Message-ID: <20260410132225.GA354601-robh@kernel.org>
References: <20260408062942.7128-1-corvin.koehne@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260408062942.7128-1-corvin.koehne@gmail.com>

On Wed, Apr 08, 2026 at 08:29:42AM +0200, Corvin Köhne wrote:
> From: Corvin Köhne <c.koehne@beckhoff.com>
> 
> Changes leds/common.h DT binding header file to be published under GPLv2
> or BSD-2-Clause license terms. This change allows this common LED
> bindings header file to be used in software components as bootloaders
> and OSes that are not published under GPLv2 terms.
> 
> All contributors to leds/common.h file in copy.
> 
> Cc: Ashley Towns <mail@ashleytowns.id.au>

I don't think a one line change is copyright-able work.

> Cc: Dan Murphy <dmurphy@ti.com>

Dan doesn't appear in git blame.

> Cc: Gergo Koteles <soyer@irl.hu>

Another oneliner.

> Cc: INAGAKI Hiroshi <musashino.open@gmail.com>

only 3 lines... Shrug

> Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> Cc: Olliver Schinagl <oliver@schinagl.nl>

Just adding more colors to the list.

> Cc: Pavel Machek <pavel@ucw.cz>
> Cc: Rafał Miłecki <rafal@milecki.pl>
> Cc: Roderick Colenbrander <roderick@gaikai.com>

5 lines of basically the same thing.

So really, I think it is mainly Jacek's and Pavel's acks we need.

Rob
