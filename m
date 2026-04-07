Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2673F35F163;
	Tue,  7 Apr 2026 11:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775562324; cv=none; b=KhuIXXnwQ2/M1aySzy4LDrzStV3UDDkmzxrB5vgMC+eKQ2J6OofGCsuM5bsfADzk9OW7Nk+4PK9MBqUU3t7YsObGkyqBfKeFlZ5PGnWOov/mjqz53kowBeGvorzVPzuq/ta6TigT2gboLs4ZCHmo8RHB2h2y0/OsX0pI2+kUE2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775562324; c=relaxed/simple;
	bh=0Tlwu+/dQuwa0V7IA55JD5sXNpq/aERErDRbd3w3xww=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C0nRqnNK9oJ7h2tUHQtSjGh/ZV2A1MypzZwDaPd9FeJU2Sy2ZTw8rKDZjOkWT3Lztdl14Pa0EpPxfWx83SKsXGK//Z0Tyke/RA8gIhKoKWvp4tS+HrzLhN+f3VuUwSe99o8bAZ9TeG6kthFFGJCO4uBueHcZuaYvyNF2bJdHWAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=yFQwQaC1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="yFQwQaC1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D885C116C6;
	Tue,  7 Apr 2026 11:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1775562323;
	bh=0Tlwu+/dQuwa0V7IA55JD5sXNpq/aERErDRbd3w3xww=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=yFQwQaC1UcUmoTkjaLFn6t5Wt66b3JuUeQM5ky9nY5LxKeaiYudAsWNo1cf5KpJuV
	 yQkeLHJDnUAi/iqENSK7YBhjZJ3ov3BsVRE5rwNk/jzywRlgXa+2RLxdhywmuQZuC/
	 LKx7rcO00hBFduXllAaY74a3i9TvaXt7tJpYaiCE=
Date: Tue, 7 Apr 2026 13:45:21 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Corvin =?iso-8859-1?Q?K=F6hne?= <corvin.koehne@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	Rob Herring <robh@kernel.org>,
	"open list:LED SUBSYSTEM" <linux-leds@vger.kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Corvin =?iso-8859-1?Q?K=F6hne?= <c.koehne@beckhoff.com>,
	Ashley Towns <mail@ashleytowns.id.au>, Dan Murphy <dmurphy@ti.com>,
	Gergo Koteles <soyer@irl.hu>,
	INAGAKI Hiroshi <musashino.open@gmail.com>,
	Jacek Anaszewski <j.anaszewski@samsung.com>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Olliver Schinagl <oliver@schinagl.nl>, Pavel Machek <pavel@ucw.cz>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
	Roderick Colenbrander <roderick@gaikai.com>
Subject: Re: [PATCH] dt-binding: leds: publish common bindings under dual
 license
Message-ID: <2026040758-retool-wrecker-0301@gregkh>
References: <20260407113941.43239-1-corvin.koehne@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260407113941.43239-1-corvin.koehne@gmail.com>

On Tue, Apr 07, 2026 at 01:39:41PM +0200, Corvin Köhne wrote:
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
> Cc: Dan Murphy <dmurphy@ti.com>
> Cc: Gergo Koteles <soyer@irl.hu>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

My only change was to put the proper SPDX line on the file, so my
opinion/change does not count here for a licensing change, sorry.

thanks,

greg k-h
