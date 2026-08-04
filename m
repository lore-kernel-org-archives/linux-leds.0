Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDE614908B2;
	Tue,  4 Aug 2026 19:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785871536; cv=none; b=Yj0AEdZdxPpN2ZMDj1U1o3iPg+xsIx2us7NkIUyFuHt1w6+tiHRa18molyJhbW43Nc5X9Jgc00RmYT/VB+z5eF5PDiZDtApYysPVJmH4vcptCH/CDNt3Q3TGHhamIthFxxvjq44ZDoZEkrT2q/sbL5smHicV/2jlyO/t+z3Jg84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785871536; c=relaxed/simple;
	bh=CJxWcrDibHCEKoeZd/e5Rf1Yh3ijLK09QAciAxRz43o=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JRKI0gARoaVz/tCwxNmZ+N4Ok3qk5pKso8B7yw3ctPLNhdtCj/j4+uedsTyWXt/kFMm2+dSm5ErjvUc/x4EDqqGYlWfVNNQLw41Cp/pllWmZ8z9te/V/5hmfxoARR1Cr/1p3hX8KVtT6z1fE6FuCvXIgKMt6RLTJsdP6XtXFbDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PiOVqt29; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PiOVqt29"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49C971F00A3D;
	Tue,  4 Aug 2026 19:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785871534;
	bh=CJxWcrDibHCEKoeZd/e5Rf1Yh3ijLK09QAciAxRz43o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PiOVqt29KtSLDai6PFFtNND43tVypjTtldu1FN1kUdZo4uNejdV+s7ojtUEiMYjvG
	 oTWpMd/D5ugtp8sZpPQ0LOr7IwjOAJIm+d1dnW9cRJOqXlcyXd+K4sDseFF+TmBAD+
	 HNXsXH+XmQ0APOcM2nTptsg5YdDav9pERpfm++qQVfeEJr8s6lKzNSUX/6TZOV5y5L
	 3gvqgGsbFeKtnPFIoBYPMwDJ2U0nHDDWQn/V5jUBDg9smXe+xyodTpmglM9gZLCWph
	 GgUkp2UqbZgQk27oikAMi9T/yu3sEcdln2W1CFXqtuteYAfJJC3z5TFVTLFPgZAvm7
	 Ezk5fUGQKSufw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V3] leds: rgb: leds-group-multicolor: Implement
 default-intensity
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stefan Wahren" <wahrenst@gmx.net>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, linux-leds@vger.kernel.org, lee@kernel.org, robh@kernel.org
In-Reply-To: <20260804191158.41976-1-wahrenst@gmx.net>
References: <20260804191158.41976-1-wahrenst@gmx.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 04 Aug 2026 19:25:33 +0000
Message-Id: <20260804192534.49C971F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> Currently it's not possible to specify the initial color of a LED
> multicolor group during boot. So implement the default-intensity property
> similar to the leds-pwm-multicolor driver. In case the property is
> missing, the old behavior is kept.
>=20
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260804191158.4197=
6-1-wahrenst@gmx.net?part=3D1

