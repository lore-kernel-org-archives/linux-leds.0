Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52E63332610;
	Wed, 12 Aug 2026 13:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786541286; cv=none; b=XVHY6gsP0j6zJ6BTDSDNPpXdWEPmLTKhSQKkRcG0kdZuJF0yp/C+JTSpCxGzs9D/FzJ1xJdcTlYnSpRs3baHV5fzsrwtwAZ3yZH62HHo+26r/9oRr/jg5OMIPfcIi3zwi/rUdjtkTpc/wpy6aBtBHrlc+xRXju0RGLUpH6K+86M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786541286; c=relaxed/simple;
	bh=9RSNJeUWXvmI7haFzvrgMWYH2faOYGZxcHAIPIRNSnA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qXkMXxlsiH+SOTeT34AmIM/pKdgDWWGlH4LmKlSKMYCt4CIZfvIbhByu851Gr4bsvDBcxzfej1ZoOA65ro3ydtRlVLH3NgMIzCDRPR4j6X4rjJQZrXJyZxgX1uaaznrfzrRyxDnV/a8SzovWE8qn825B1SXtbELHdsT2dhGVVcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gMwHz1Ci; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gMwHz1Ci"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF6A41F000E9;
	Wed, 12 Aug 2026 13:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786541281;
	bh=iP7J+rxq0cba/p7N7r8telvnSXwkH9gP5QzM6KxZEmg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gMwHz1CigRVWYGCEaYaVjobBjz/ckq3F9khPklRmJMKZXGJvc6CfrsyBd+lsIDoyg
	 tx0v6O31THd8pfc6tSvYlVv9s4U4cDpxjLUbH/ngnY99YsxDaNnrJXiGGplGvcnUSh
	 WKu5Alsaxawit21bccwwVi3WX3PbCxkZcl3hBC2CmuzEpwH3dhCw4JJzvNImj1zafw
	 oNEbUJW1gLZvSRZZS48lK8SPZoOJzuvJ71MqKqxmovTo+X+DGcE0hOTEfRLQDPIOfj
	 A0BI8KPAyopjBwwIu+i0eizRCV9t4HN2fcr7Obb8rKEyYqD0Lgx1NW7yYYX77RKBCj
	 W7ZAnaj1qjR3g==
Date: Wed, 12 Aug 2026 14:27:55 +0100
From: Lee Jones <lee@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Cc: Rudraksha Gupta <guptarud@gmail.com>,
	devnull+guptarud.gmail.com@kernel.org, andersson@kernel.org,
	broonie@kernel.org, conor+dt@kernel.org, conor.dooley@microchip.com,
	david@ixit.cz, devicetree@vger.kernel.org,
	konrad.dybcio@oss.qualcomm.com, konradybcio@kernel.org,
	krzk+dt@kernel.org, lgirdwood@gmail.com,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org, pavel@kernel.org,
	phone-devel@vger.kernel.org, robh@kernel.org
Subject: Re: [PATCH v6 0/3] Samsung Expressatt: Camera Flash
Message-ID: <20260812132755.GT1072730@google.com>
References: <20260527-expressatt_camera_flash-v6-0-de0f150024e4@gmail.com>
 <73033a32-4efe-4ed2-9319-ffb205d28719@gmail.com>
 <CAD++jLkc953WROweQ0=BVRmyOMUdqx68XSS3VoBmqfyzbGeCdw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD++jLkc953WROweQ0=BVRmyOMUdqx68XSS3VoBmqfyzbGeCdw@mail.gmail.com>

On Wed, 12 Aug 2026, Linus Walleij wrote:

> On Tue, Aug 11, 2026 at 11:31 AM Rudraksha Gupta <guptarud@gmail.com> wrote:
> 
> > https://lore.kernel.org/all/20260527-expressatt_camera_flash-v6-0-de0f150024e4@gmail.com/#t
> >
> > This series seems to have fallen in between the cracks. Should I resend
> > this patch series?
> 
> Let's just gently poke Lee about it and see what he says.

Sorry, it had slipped through.  Please submit a [RESEND].

-- 
Lee Jones
