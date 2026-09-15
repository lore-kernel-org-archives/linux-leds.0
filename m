Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CF013B0ADB;
	Tue, 15 Sep 2026 14:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789482199; cv=none; b=hD+6z9KvIbgKKjvouMzZmz41DpDzEVrrDrIY+0d3H0X10FExGM4Q/5mhkv6+ll7rkJEqsLFjx2uyFHJ7c8w5gU+w1Pt8V51Kkvhh5bhmYyLv1uvuVow14Z/o5FoJp5dU9VVRAFyJA5CQDs3OaOeoeriuiDPztPCDyiVuqGb4GN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789482199; c=relaxed/simple;
	bh=NXXkM67iLYyfCB79jq9QFobVJGfCWRQlwjJWbKqqp3Q=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=OiN9urX7+Dfp/4R/bb8G952kexO6G3iGGvTnRc/b5hiaQdYApKqzXo4HP2LbXCljhpAhQ5WXlUPNl/2cWJhin8ihI5eHddn431Ew3muc9VMggvJ2zdRz21DYzrznXnfFgeQTIRT+NOYdZ/nff1a3ZKXHbisRtTB+tU5Q+JL0YLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TxRvjiHS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TxRvjiHS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 430C61F000FF;
	Tue, 15 Sep 2026 14:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789482197;
	bh=NXXkM67iLYyfCB79jq9QFobVJGfCWRQlwjJWbKqqp3Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TxRvjiHSJDT6Ndv4fOqa4hgCVhZVsO4aP1aMHYtyXgU9ipaCJlKLn/SXdd4acyhPA
	 MWjVPNeWgvZM8HmgpFL5AAaQhW18HElX8Zv+nq4qX4CvBNOaxI3MGI0wWRHqWCYNpW
	 TWN8p009xOFB3oVQUaD3vEPnzCJeSwnDwooAxHU0Rmj+zyFSZOq1aOcSTvK/o1a7SG
	 HH/krgRMcIbPCtQzMA/VICVjtKoc8WvRTNRygznQAEhO1pIf6FIEtIGzP7mtLXhTxu
	 qKoIU/YV8ISHlGoIET4vjxBJywuVZVUWbiS9SSbgsv1HC7J+XjOZYY8SJRMoMr9fDB
	 bAJynK2N2d6yg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 6/8] leds: pca995x: Add sysfs files for error
 reporting
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nora Schiffer" <nora.schiffer@ew.tq-group.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <5394b238da830a363bd66a3e0b212bdecc64ba25.1789477502.git.nora.schiffer@ew.tq-group.com>
References: <bd687915af26ccdbfc8cc911eee0787fc8145ae1.1789477502.git.nora.schiffer@ew.tq-group.com>
 <5394b238da830a363bd66a3e0b212bdecc64ba25.1789477502.git.nora.schiffer@ew.tq-group.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 15 Sep 2026 14:23:16 +0000
Message-Id: <20260915142317.430C61F000FF@smtp.kernel.org>
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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/bd687915af26ccdbfc8=
cc911eee0787fc8145ae1.1789477502.git.nora.schiffer@ew.tq-group.com?part=3D6

