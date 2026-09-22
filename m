Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48AD1378D8D;
	Tue, 22 Sep 2026 14:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790089016; cv=none; b=oo6p5SvmaR3YTQfjE6YiSeUlfdjYfUMOXDoR0fHQTwaetWLQqtEG8TC+lJ0q0QW43azc8+CwaRNVChao9C3mYMe6z9OmBj7YFXS6cmqnxFFw9vfevMGtNMgOqVwF+v1hUD2XRdaLX6dbO+3R3OBWuuOr6SjisG1QH41Q5WWRsRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790089016; c=relaxed/simple;
	bh=onXfPE4I6kVEDRyprhZcf5IcNDDGu/m8ecI7AQ/nHDU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=N7OLQntgqe76xQLW4VqE+w/1rRsgP9IEBzoHJkp7/1MAAAk/HUPyJtd3qRouCNYCmwO8q5vcKsHvSoDzp246NKFIGTK9isvJa5geKpMsg/2wHdYUZXtykI/A5y20tHN9atO/Kyaer5x9O1tcKRgShHvul7TZYadplOUd0b3OnAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UopHGv8D; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UopHGv8D"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFF731F000FF;
	Tue, 22 Sep 2026 14:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790089015;
	bh=onXfPE4I6kVEDRyprhZcf5IcNDDGu/m8ecI7AQ/nHDU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UopHGv8DY2viEONUcKc9DwiWU/RR67WRoh+7SWLDjukEayFDu7B5/Z6UxFQVYL5i3
	 ReSbleoYLALlNnSi0oCn6WcA4ND2G7fev9fiXaIYDgPioH/hQEWooa+QLjVmkmeNIn
	 IvVM6vitB4WwvYVwQcC7PPMkfjMdbWD1knM01Bw/A1Hzwx1xrH8DoT40dlp+amaDYc
	 xbN6sqF5RdOmMkLmuDdgkOJWOqrYAcy3okZ203X+uuDFqk71mih0g+ROVDo23K5ve8
	 6hZZQgfD1tcINWpcQ9KXga5UXxtsD1B3YQ91rq0/sx9QKQgbhw9/JcuI4kGz9ANC+m
	 XJ2qA8m9JCkug==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 08/10] leds: pca995x: Add sysfs files for error
 reporting
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nora Schiffer" <nora.schiffer@ew.tq-group.com>
Cc: lee@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, linux-leds@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <9c5bb10d247abc5acb752a4b884c2c3612abecdb.1790087890.git.nora.schiffer@ew.tq-group.com>
References: <cover.1790087890.git.nora.schiffer@ew.tq-group.com>
 <9c5bb10d247abc5acb752a4b884c2c3612abecdb.1790087890.git.nora.schiffer@ew.tq-group.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Sep 2026 14:56:54 +0000
Message-Id: <20260922145654.BFF731F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> The PCA995x has builtin failure detection. Provide sysfs files for
> individual LED status (reporting "okay", "short-circuit" or
> "open-circuit") as well as a global "has_errors" flag. has_errors is
> sticky and must be cleared by writing "clear" to the sysfs file.
>=20
> Signed-off-by: Nora Schiffer <nora.schiffer@ew.tq-group.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1790087890.gi=
t.nora.schiffer@ew.tq-group.com?part=3D8

