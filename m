Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB51B4052D7
	for <linux-leds@vger.kernel.org>; Thu, 17 Sep 2026 21:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789680120; cv=none; b=KEn3lk/dQQbmV9wdO7bUJkEG4FkEam62RDxJjJpCrf2WrNCOi1caKXFMUPyCaTHeJ5NMEhIJ6xYL/FOoVT9wGd+98lStzNAeCOEyGNRube8Nhk7xDaUHN6+fwGNVOJ+KLKdMLWhqC8ctz+sYsO2G9jM3bj6hucHszM8uvBQWBnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789680120; c=relaxed/simple;
	bh=3GXyV/Xwny2145Mg/LAuyfy+Um460/BZgy1PiATW9K8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=QkgFqGDhYwM4GO9jmiUocqikCuA78icC4j6mCvLHGzI5KeUo++Ar0JHCG+FyEf5c3sB09v7K5627/R6IexkDxx7QWR05OWkbtNfCNXDEojblD0oxaseP8VdJDEWBVl37KEPHSn8wCjUZU+/0EzfRHyx0gjQd6g3FrhWWh0i4bVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MKgx69i1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MKgx69i1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 482F61F000FF;
	Thu, 17 Sep 2026 21:21:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789680118;
	bh=3GXyV/Xwny2145Mg/LAuyfy+Um460/BZgy1PiATW9K8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MKgx69i1jjJAwIdkzhCN51hoXjbgpK8bfht1ti4+EKt/tlK7kQoHlVyhFCGc7LHRO
	 9lXolm7nN7w1aZUSs2iW7saWVaYMgqCXwg8xvuA1Texjm58pR6oOD+n35x3UpIbTo2
	 6oxxuVcljyxsxJ00tHXvOdlFENBsv5QgyAWRRAp13Tus4sn37pv1TGr0hfkL53tYm3
	 vGvipEBZO/de2s3Go5Y8IyzrKXBnaHd8QtOJlkLb5BY5T+IA7BBecfOF5NfzRnEUa7
	 u/BqQU7zqFX9Khk7ia5wf0+Z6bDVwuunWrk8h0W/DJ61OpA40hJvz2jXi8fRnWdK7v
	 gKjLYH914DtVQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] leds: aat1290: Allocate mm_current_scale with
 ARRAY_SIZE()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kees Cook" <kees@kernel.org>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20260917211357.i.412-kees@kernel.org>
References: <20260917211357.i.412-kees@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 17 Sep 2026 21:21:57 +0000
Message-Id: <20260917212158.482F61F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> From: Kees Cook <kees+treewide@kernel.org>
>=20
> In preparation for making the devm_kmalloc family of allocators type
> aware, we need to make sure that the returned type from the allocation
> matches the type of the variable being assigned. (Before, the allocator
> would always return "void *", which can be implicitly cast to any
> pointer type.)
>=20
> This allocates one int per entry of max_mm_current_percent, but the size
> was taken from the whole array, which would make the allocation type a
> pointer to the array rather than the "int *" being assigned. Allocate
> ARRAY_SIZE-many entries instead. The resulting allocation size is the
> same: AAT1290_MM_CURRENT_SCALE_SIZE and
> ARRAY_SIZE(max_mm_current_percent) are both 15.
>=20
> Build tested ARCH=3Dx86_64 allmodconfig with GCC 16.2.0:
> drivers/leds/flash/leds-aat1290.o
>=20
> Assisted-by: LLM coccinelle
> Signed-off-by: Kees Cook <kees+treewide@kernel.org>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260917211357.i.41=
2-kees@kernel.org?part=3D1

