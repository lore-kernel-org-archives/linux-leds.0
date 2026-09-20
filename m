Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D368A23ABBE
	for <linux-leds@vger.kernel.org>; Sun, 20 Sep 2026 19:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789934261; cv=none; b=pDSNamnCF3adVmOgfsYIIrAi0q6uXGfkKpsEHcBehfm1dtx0wds7wBBg3j/lhSrcoyNclWBoOdlJvgSjzys+zNgmCNNVCKXG+U/fF66tQIqoY3LcCA76js542CzFFOc7hUWXLK6leJ/YRo1mSNMLCvrq/B8iTaBc4WhkXRIIwTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789934261; c=relaxed/simple;
	bh=DmjO3ijsmkYfQH8bv2RrNRzy4OzvYwTB0f57C0MH8fY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=auf4TQoJlE4Lbd5hbQqASZWJvLW97eTwx0u2Rcr/HvqA5YdQfFnUIIvGR7ufygK04G8Ab8HXj6TuSWmdUio0XU7l/5MwB5OxU1YTg5jdj+KHSiwIjuBsw+L24QqQe8kWM7BsDEEfd3MqHCLbgF8W89OYtdElZn6tGBHPJCm3Mr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R9M+ZkdR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R9M+ZkdR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86B911F00893;
	Sun, 20 Sep 2026 19:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789934260;
	bh=DmjO3ijsmkYfQH8bv2RrNRzy4OzvYwTB0f57C0MH8fY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=R9M+ZkdR9VX/67WBLeFYwdh1o0IdG7pB2j9fO2KjcewbOIHhkqKYLH3WaQKHbNPS1
	 vhUOsdqbNGH1VBqh7fXQqdBEfRIaoAJZgj+381O487IcsRydb6spE7vaVIfUN91A5V
	 DN/7R9rlfKxsR+MWs0CmvhvF4eC9Y2/IoqeO6gh1ic2eWGf2Gx3yXwA+scJv/zJ0jm
	 xBNTukDXSZZtHL530lYNeTp1eSZRpYseLQhXTkP4hnicTAq/GmJdQLiI38f5IZpXbX
	 qzPxeilO461ZtWiIur3CVhKLxwHo51tz0K2pSjtW6Hi+0hRdfnJ5Ry11uXDD5klPgg
	 ePhk8FzmV/u6Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 11/13] platform/x86: ideapad-laptop: Serialize
 keyboard backlight tracking
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rong Zhang" <i@rong.moe>
Cc: lee@kernel.org, linux-leds@vger.kernel.org
In-Reply-To: <20260921-leds-trigger-hw-changed-v7-11-fe3cdb6dec51@rong.moe>
References: <20260921-leds-trigger-hw-changed-v7-0-fe3cdb6dec51@rong.moe>
 <20260921-leds-trigger-hw-changed-v7-11-fe3cdb6dec51@rong.moe>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 20 Sep 2026 19:57:40 +0000
Message-Id: <20260920195740.86B911F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> ACPI notifications are delivered in dedicated work contexts and may
> arrive simultaneously. In the following change, much work will be done
> while handling the notification, which could lead to potential race
> conditions.
>=20
> Introduce a new mutex to serialize keyboard backlight tracking to
> prevent potential race conditions.
>=20
> Acked-by: Ike Panhc <ikepanhc@gmail.com>
> Signed-off-by: Rong Zhang <i@rong.moe>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260921-leds-trigg=
er-hw-changed-v7-0-fe3cdb6dec51@rong.moe?part=3D11

